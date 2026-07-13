#include <iostream>
#include "ap_fixed.h"

typedef ap_fixed<16, 8> data_t;

// Top function prototype
void resnet50_bottleneck(
    data_t *input_tensor,
    data_t *output_tensor,
    const data_t *w_1x1_a,
    const data_t *w_3x3,
    const data_t *w_1x1_b
);

int main() {
    std::cout << "--- Starting ResNet50 Bottleneck Testbench ---" << std::endl;

    // Calculate Sizes
    int tensor_size = 256 * 56 * 56; // 802,816 elements!
    
    // HEAP ALLOCATION (Crucial for ResNet sizes)
    data_t *input = new data_t[tensor_size];
    data_t *output = new data_t[tensor_size];
    
    // Dummy weight arrays
    data_t *w1 = new data_t[256 * 64]; 
    data_t *w2 = new data_t[64 * 64 * 3 * 3];
    data_t *w3 = new data_t[64 * 256];

    // Initialize with a test value
    for (int i = 0; i < tensor_size; i++) {
        input[i] = (data_t)2.0f; 
    }

    std::cout << "Executing Hardware Kernel..." << std::endl;
    resnet50_bottleneck(input, output, w1, w2, w3);

    // Verify Output: If F(x) simulates *0.5, then F(2.0) = 1.0. 
    // Skip connection adds input: 1.0 + 2.0 = 3.0.
    std::cout << "Input pixel: " << input[0] << std::endl;
    std::cout << "Output pixel (Expected ~3.0): " << output[0] << std::endl;

    delete[] input; delete[] output; 
    delete[] w1; delete[] w2; delete[] w3;

    std::cout << "Simulation Complete!" << std::endl;
    return 0;
}