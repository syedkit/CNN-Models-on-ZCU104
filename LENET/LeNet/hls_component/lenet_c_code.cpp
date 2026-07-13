#include "lenet.h"
#include <hls_stream.h>

#define IN_CH 1
#define IN_WIDTH 32
#define CONV1_OUT_CH 6
#define CONV1_KERNEL 5
// ... (Keep the rest of your macros here)

// The actual hardware logic
void lenet_kernel(
    data_t *input_data,
    data_t *output_data,
    const data_t *weights
) {
    #pragma HLS INTERFACE m_axi port=input_data offset=slave bundle=gmem0
    #pragma HLS INTERFACE m_axi port=output_data offset=slave bundle=gmem1
    #pragma HLS INTERFACE s_axilite port=return bundle=control

    data_t local_in[1][32][32];
    data_t layer1_out[6][28][28];
    
    #pragma HLS ARRAY_PARTITION variable=local_in complete dim=1

    for(int i=0; i<1024; i++) {
        #pragma HLS PIPELINE II=1
        local_in[0][i/32][i%32] = input_data[i];
    }

    // Dummy logic for testing memory interfaces
    for(int i=0; i<10; i++) {
        #pragma HLS PIPELINE II=1
        output_data[i] = local_in[0][0][i]; 
    }
}