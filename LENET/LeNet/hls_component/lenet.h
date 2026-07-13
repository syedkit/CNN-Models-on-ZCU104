#ifndef LENET_H
#define LENET_H

#include <ap_fixed.h>

// Define the data type ONCE here
typedef ap_fixed<16, 8> data_t;

// Declare the kernel function ONCE here
void lenet_kernel(
    data_t *input_data,
    data_t *output_data,
    const data_t *weights
);

#endif // LENET_H