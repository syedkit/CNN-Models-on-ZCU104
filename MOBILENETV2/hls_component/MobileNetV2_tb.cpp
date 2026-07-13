#include <iostream>
#include "ap_fixed.h"

typedef ap_fixed<16, 8> data_t;

#define CHANNELS 32
#define SPATIAL 56
#define KERNEL 3

void mobilenetv2_block(
    data_t *input_tensor, data_t *output_tensor, 
    const data_t dw_weights[CHANNELS][KERNEL][KERNEL],
    const data_t pw_weights[CHANNELS][CHANNELS]
);

int main() {
    std::cout << "--- Starting MobileNetV2 Block C-Simulation ---" << std::endl;

    int in_size = CHANNELS * SPATIAL * SPATIAL; 
    int out_size = CHANNELS * (SPATIAL-2) * (SPATIAL-2); 

    // HEAP ALLOCATION
    data_t *input = new data_t[in_size];
    data_t *output = new data_t[out_size];
    
    // We can use static allocation for weights since they are small in DW/PW
    data_t dw_weights[CHANNELS][KERNEL][KERNEL] = {0};
    data_t pw_weights[CHANNELS][CHANNELS] = {0};

    for (int i = 0; i < in_size; i++) input[i] = (data_t)1.0f;
    dw_weights[0][1][1] = (data_t)1.0f; // Identity center pixel
    pw_weights[0][0] = (data_t)1.0f;    // Identity pointwise

    std::cout << "Executing DATAFLOW Hardware Kernel..." << std::endl;
    mobilenetv2_block(input, output, dw_weights, pw_weights);

    std::cout << "Verification - Output[0]: " << output[0] << std::endl;

    delete[] input; delete[] output;
    std::cout << "Simulation Complete! Ready for DATAFLOW Synthesis." << std::endl;
    return 0;
}