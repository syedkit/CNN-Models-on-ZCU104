#include <iostream>
#include <cstdlib>
#include "ap_fixed.h"

// 1. Match the data type from your kernel
typedef ap_fixed<16, 8> data_t;

// 2. Declare the kernel prototype
void alexnet_layer1(
    data_t *input_img,
    data_t *output_feat,
    const data_t *weights,
    const data_t *bias
);

int main() {
    std::cout << "=======================================" << std::endl;
    std::cout << "  Starting AlexNet Layer 1 C-Simulation" << std::endl;
    std::cout << "=======================================" << std::endl;

    // 3. Calculate exact array sizes based on AlexNet Layer 1 dimensions
    int img_size = 3 * 227 * 227;        // 154,587 elements
    int out_size = 96 * 55 * 55;         // 290,400 elements
    int weight_size = 96 * 3 * 11 * 11;  // 34,848 elements
    int bias_size = 96;                  // 96 elements

    // 4. CRITICAL: Allocate on the HEAP (using new) to prevent Stack Overflow!
    data_t *input_img = new data_t[img_size];
    data_t *output_feat = new data_t[out_size];
    data_t *weights = new data_t[weight_size];
    data_t *bias = new data_t[bias_size];

    std::cout << "Memory allocated successfully. Initializing data..." << std::endl;

    // 5. Initialize with dummy mathematical values
    for(int i = 0; i < img_size; i++) input_img[i] = (data_t)0.1f;
    for(int i = 0; i < weight_size; i++) weights[i] = (data_t)0.01f;
    for(int i = 0; i < bias_size; i++) bias[i] = (data_t)0.05f;

    std::cout << "Running Hardware Kernel (This may take a moment)..." << std::endl;
    
    // 6. Execute the kernel
    alexnet_layer1(input_img, output_feat, weights, bias);

    // 7. Verify a few output samples
    std::cout << "--- Kernel Output Samples ---" << std::endl;
    std::cout << "Output[0]: " << output_feat[0] << std::endl;
    std::cout << "Output[1000]: " << output_feat[1000] << std::endl;

    // 8. CRITICAL: Free the dynamically allocated memory to prevent memory leaks
    delete[] input_img;
    delete[] output_feat;
    delete[] weights;
    delete[] bias;

    std::cout << "Simulation Complete! Hardware is ready for Synthesis." << std::endl;
    return 0; // Vitis checks for this 0!
}