#include "ap_fixed.h"
#include <hls_stream.h>

typedef ap_fixed<16, 8> data_t;

// ResNet50 Bottleneck Dimensions (Example: Layer 2)
#define CH_IN 256
#define CH_BOT 64   // Bottlenecked channels
#define SPATIAL 56  // 56x56 feature map

// TOP FUNCTION
void resnet50_bottleneck(
    data_t *input_tensor,   // AXI Master
    data_t *output_tensor,  // AXI Master
    const data_t *w_1x1_a,  // Weights for shrink
    const data_t *w_3x3,    // Weights for spatial
    const data_t *w_1x1_b   // Weights for expand
) {
    #pragma HLS INTERFACE m_axi port=input_tensor offset=slave bundle=gmem0
    #pragma HLS INTERFACE m_axi port=output_tensor offset=slave bundle=gmem1
    #pragma HLS INTERFACE m_axi port=w_1x1_a offset=slave bundle=gmem2
    #pragma HLS INTERFACE m_axi port=w_3x3 offset=slave bundle=gmem3
    #pragma HLS INTERFACE m_axi port=w_1x1_b offset=slave bundle=gmem4
    #pragma HLS INTERFACE s_axilite port=return

    // HARDWARE SYNCHRONIZATION FIFO (The Skip Connection!)
    // We stream the original input into a FIFO to wait for the convolutions to finish.
    hls::stream<data_t> skip_connection_fifo("skip_fifo");
    #pragma HLS STREAM variable=skip_connection_fifo depth=1024

    // Local buffers for tiling (abstracted for brevity)
    data_t local_in[CH_IN];
    data_t local_out[CH_IN];

    // Main Processing Loop over the spatial map
    for (int r = 0; r < SPATIAL; r++) {
        for (int c = 0; c < SPATIAL; c++) {
            
            // 1. Fetch Input & Push to Skip Connection FIFO
            for (int ch = 0; ch < CH_IN; ch++) {
                #pragma HLS PIPELINE II=1
                data_t pixel = input_tensor[(ch * SPATIAL * SPATIAL) + (r * SPATIAL) + c];
                local_in[ch] = pixel;
                skip_connection_fifo.write(pixel); // SAVE FOR LATER!
            }

            // ----------------------------------------------------
            // 2. The Heavy Convolution Pipeline (F(x))
            // In a real design, these are complex nested loops mapped to DSPs
            // Here we represent the data flow abstraction.
            // 1x1 Conv -> 3x3 Conv -> 1x1 Conv
            // ... (DSP Multiply-Accumulate logic taking hundreds of cycles) ...
            
            // Dummy logic to represent the F(x) output
            for (int ch = 0; ch < CH_IN; ch++) {
                local_out[ch] = local_in[ch] * (data_t)0.5; // Simulated Conv output
            }
            // ----------------------------------------------------

            // 3. THE RESIDUAL ADDITION (F(x) + x)
            for (int ch = 0; ch < CH_IN; ch++) {
                #pragma HLS PIPELINE II=1
                data_t f_x = local_out[ch];
                data_t x = skip_connection_fifo.read(); // RETRIEVE FROM PAST!
                
                data_t added = f_x + x;
                
                // ReLU Activation & Write to DDR
                output_tensor[(ch * SPATIAL * SPATIAL) + (r * SPATIAL) + c] = (added > 0) ? added : (data_t)0;
            }
        }
    }
}