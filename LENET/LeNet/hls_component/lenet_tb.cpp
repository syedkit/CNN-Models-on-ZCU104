#include <iostream>
#include "lenet.h" // Include the shared header!

int main() {
    std::cout << "=======================================" << std::endl;
    std::cout << "   Starting LeNet C-Simulation...      " << std::endl;
    std::cout << "=======================================" << std::endl;

    data_t input_image[1024];
    data_t output_predictions[10];
    data_t dummy_weights[100]; 

    // FIX: Do the math in float FIRST, then cast to data_t
    for (int i = 0; i < 1024; i++) {
        float temp_val = (float)(i % 256) / 256.0f;
        input_image[i] = (data_t)temp_val; 
    }

    // Execute the kernel
    lenet_kernel(input_image, output_predictions, dummy_weights);

    std::cout << "--- Kernel Output ---" << std::endl;
    for (int i = 0; i < 10; i++) {
        std::cout << "Digit Class " << i << ": " << output_predictions[i] << std::endl;
    }

    std::cout << "Simulation Complete! Hardware is ready for Synthesis." << std::endl;
    return 0; 
}