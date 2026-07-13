#include "ap_fixed.h"
#include <hls_stream.h>

typedef ap_fixed<16, 8> data_t;

// MobileNetV2 Separable Conv Parameters
#define CHANNELS 32
#define SPATIAL 56
#define KERNEL 3

// --------------------------------------------------------
// SUB-MODULE 1: Depthwise Convolution (Using Line Buffers)
// --------------------------------------------------------
void depthwise_conv(
    hls::stream<data_t> &in_stream, 
    hls::stream<data_t> &out_stream, 
    const data_t dw_weights[CHANNELS][KERNEL][KERNEL]
) {
    // The Line Buffer: Stores exactly 3 rows of the image.
    data_t line_buffer[KERNEL][SPATIAL];
    #pragma HLS ARRAY_PARTITION variable=line_buffer complete dim=1
    
    // The 3x3 sliding window registers
    data_t window[KERNEL][KERNEL];
    #pragma HLS ARRAY_PARTITION variable=window complete dim=0

    for (int ch = 0; ch < CHANNELS; ch++) {
        for (int r = 0; r < SPATIAL; r++) {
            for (int c = 0; c < SPATIAL; c++) {
                #pragma HLS PIPELINE II=1
                
                // 1. Shift the Line Buffer UP
                data_t new_pixel = in_stream.read();
                for (int i = 0; i < KERNEL - 1; i++) {
                    line_buffer[i][c] = line_buffer[i+1][c];
                }
                line_buffer[KERNEL-1][c] = new_pixel; // Load new pixel at bottom

                // 2. Shift the Window LEFT
                for (int i = 0; i < KERNEL; i++) {
                    for (int j = 0; j < KERNEL - 1; j++) {
                        window[i][j] = window[i][j+1];
                    }
                    window[i][KERNEL-1] = line_buffer[i][c]; // Load new column
                }

                // 3. Compute 3x3 Depthwise Math (Only happens when window is full)
                if (r >= 2 && c >= 2) {
                    data_t sum = 0;
                    for (int kr = 0; kr < KERNEL; kr++) {
                        for (int kc = 0; kc < KERNEL; kc++) {
                            sum += window[kr][kc] * dw_weights[ch][kr][kc];
                        }
                    }
                    out_stream.write((sum > 0) ? sum : (data_t)0); // ReLU6 usually used here
                }
            }
        }
    }
}

// --------------------------------------------------------
// SUB-MODULE 2: Pointwise Convolution (1x1)
// --------------------------------------------------------
void pointwise_conv(
    hls::stream<data_t> &in_stream, 
    data_t *output_tensor, 
    const data_t pw_weights[CHANNELS][CHANNELS]
) {
    // 1x1 convolutions are just matrix multiplications per pixel
    // Simplified for brevity.
    for (int r = 0; r < SPATIAL - 2; r++) {
        for (int c = 0; c < SPATIAL - 2; c++) {
            
            // Read the DW output channels for this specific pixel
            data_t pixel_channels[CHANNELS];
            for (int ch = 0; ch < CHANNELS; ch++) {
                #pragma HLS PIPELINE II=1
                pixel_channels[ch] = in_stream.read();
            }

            // Multiply by 1x1 weights and write to DDR
            for (int oc = 0; oc < CHANNELS; oc++) {
                #pragma HLS PIPELINE II=1
                data_t sum = 0;
                for (int ic = 0; ic < CHANNELS; ic++) {
                    sum += pixel_channels[ic] * pw_weights[oc][ic];
                }
                output_tensor[(oc * (SPATIAL-2) * (SPATIAL-2)) + (r * (SPATIAL-2)) + c] = sum;
            }
        }
    }
}

// --------------------------------------------------------
// TOP FUNCTION: The DATAFLOW Region
// --------------------------------------------------------
void mobilenetv2_block(
    data_t *input_tensor, 
    data_t *output_tensor, 
    const data_t dw_weights[CHANNELS][KERNEL][KERNEL],
    const data_t pw_weights[CHANNELS][CHANNELS]
) {
    #pragma HLS INTERFACE m_axi port=input_tensor offset=slave bundle=gmem0
    #pragma HLS INTERFACE m_axi port=output_tensor offset=slave bundle=gmem1
    #pragma HLS INTERFACE s_axilite port=return

    // Tell the FPGA to run the internal functions SIMULTANEOUSLY
    #pragma HLS DATAFLOW

    // Internal FIFO connecting the Depthwise to the Pointwise
    hls::stream<data_t> internal_fifo("dw_to_pw_stream");
    #pragma HLS STREAM variable=internal_fifo depth=64

    // Master AXI Read logic to stream (Abstracted)
    hls::stream<data_t> input_stream("in_stream");
    for(int i=0; i<CHANNELS*SPATIAL*SPATIAL; i++) input_stream.write(input_tensor[i]);

    // The two hardware modules run concurrently!
    depthwise_conv(input_stream, internal_fifo, dw_weights);
    pointwise_conv(internal_fifo, output_tensor, pw_weights);
}