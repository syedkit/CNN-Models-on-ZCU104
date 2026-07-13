#include "ap_fixed.h"

// 16-bit fixed point is standard for Edge AI
typedef ap_fixed<16, 8> data_t;

// AlexNet Layer 1 Dimensions
#define IN_CH 3           // RGB Image
#define IN_DIM 227        // 227x227 pixels
#define OUT_CH 96         // 96 output feature maps
#define KERNEL 11         // 11x11 filter
#define STRIDE 4
#define OUT_DIM 55        // (227 - 11)/4 + 1 = 55

void alexnet_layer1(
    data_t *input_img,    // From DDR (Size: 3 x 227 x 227)
    data_t *output_feat,  // To DDR (Size: 96 x 55 x 55)
    const data_t *weights,// From DDR (Size: 96 x 3 x 11 x 11)
    const data_t *bias    // From DDR (Size: 96)
) {
    // AXI Bus Interfaces to Zynq Processing System
    #pragma HLS INTERFACE m_axi port=input_img offset=slave bundle=gmem0
    #pragma HLS INTERFACE m_axi port=output_feat offset=slave bundle=gmem1
    #pragma HLS INTERFACE m_axi port=weights offset=slave bundle=gmem2
    #pragma HLS INTERFACE m_axi port=bias offset=slave bundle=gmem3
    #pragma HLS INTERFACE s_axilite port=return

    // ON-CHIP BRAM CACHE (Tiling)
    // We cannot fit the whole image, so we buffer the weights and one output pixel's worth of inputs
    data_t local_weights[OUT_CH][IN_CH][KERNEL][KERNEL];
    data_t local_bias[OUT_CH];
    
    // Unroll the channel dimension for massive DSP parallelism
    #pragma HLS ARRAY_PARTITION variable=local_weights complete dim=2

    // 1. Load Weights into BRAM (Done once per layer)
    for(int oc=0; oc<OUT_CH; oc++) {
        local_bias[oc] = bias[oc];
        for(int ic=0; ic<IN_CH; ic++) {
            for(int kr=0; kr<KERNEL; kr++) {
                for(int kc=0; kc<KERNEL; kc++) {
                    #pragma HLS PIPELINE II=1
                    local_weights[oc][ic][kr][kc] = weights[(oc*IN_CH*KERNEL*KERNEL) + (ic*KERNEL*KERNEL) + (kr*KERNEL) + kc];
                }
            }
        }
    }

    // 2. Tiled Convolution Execution (Stride 4)
    for (int r = 0; r < OUT_DIM; r++) {
        for (int c = 0; c < OUT_DIM; c++) {
            for (int oc = 0; oc < OUT_CH; oc++) {
                #pragma HLS PIPELINE II=1
                
                data_t sum = local_bias[oc];
                
                // Multiply-Accumulate over the 11x11 Window
                for (int ic = 0; ic < IN_CH; ic++) {
                    for (int kr = 0; kr < KERNEL; kr++) {
                        for (int kc = 0; kc < KERNEL; kc++) {
                            // Calculate exact memory address based on Stride
                            int img_r = (r * STRIDE) + kr;
                            int img_c = (c * STRIDE) + kc;
                            int img_idx = (ic * IN_DIM * IN_DIM) + (img_r * IN_DIM) + img_c;
                            
                            // Note: In a production Zynq system, we would use Line Buffers here 
                            // to avoid reading the same DDR pixel multiple times.
                            data_t pixel = input_img[img_idx]; 
                            sum += pixel * local_weights[oc][ic][kr][kc];
                        }
                    }
                }
                
                // ReLU Activation & Write back to DDR
                int out_idx = (oc * OUT_DIM * OUT_DIM) + (r * OUT_DIM) + c;
                output_feat[out_idx] = (sum > 0) ? sum : (data_t)0;
            }
        }
    }
}