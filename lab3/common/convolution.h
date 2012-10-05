#ifndef _CONVOLUTION_H
#define _CONVOLUTION_H
#include <stdint.h>

/*

static float embossKernel[] = { -2.0, -1.0  ,  0, \
                                -1.0 , 1.0 , 1.0, \
                                  0  , 1.0 , 2.0 };

static float gaussianKernel3x3[] = \
  { 1.0, 2.0, 1.0, \
    2.0, 4.0, 2.0, \
    1.0, 2.0, 1.0 };

static float kernel5x5[] = \
  { 0.0, 0.0, 0.0, 0.0, 0.0, \
    0.0, 0.0, 0.0, 0.0, 0.0, \
    0.0, 0.0, 0.0, 0.0, 0.0, \
    0.0, 0.0, 0.0, 0.0, 0.0, \
    0.0, 0.0, 0.0, 0.0, 0.0 }; */

static float gaussianKernel5x5[] = \
  { 2.0,  4.0,  5.0,  4.0, 2.0, \
    4.0,  9.0, 12.0,  9.0, 4.0, \
    5.0, 12.0, 15.0, 12.0, 5.0, \
    4.0,  9.0, 12.0,  9.0, 4.0, \
    2.0,  4.0,  5.0,  4.0, 2.0 };

static float laplacianKernel5x5[] = \
  { 0.0, 0.0, 0.0, 0.0, 0.0, \
    0.0, 0.0, 1.0, 0.0, 0.0, \
    0.0, 1.0, -4.0, 1.0, 0.0, \
    0.0, 0.0, 1.0, 0.0, 0.0, \
    0.0, 0.0, 0.0, 0.0, 0.0 };

//#define FILTER_KERNEL gaussianKernel5x5
//#define KERNEL_SCALE_FACTOR (115.0)

#define FILTER_KERNEL laplacianKernel5x5
#define KERNEL_SCALE_FACTOR (1.0)

#define WINDOW_SIZE (25)
#define COEFF_WIDTH (16)
#define COEFF_FRACT (12)
#define COEFF_SCALE (1 << COEFF_FRACT)

void convolutionFilter(float *kernel, int radius, uint8_t *in, uint8_t *out, int width, int height);
#endif
