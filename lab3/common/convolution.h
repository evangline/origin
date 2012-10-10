#ifndef _CONVOLUTION_H
#define _CONVOLUTION_H
#include <stdint.h>
#include <stdlib.h>

#define WINDOW_SIZE (25)
#define COEFF_WIDTH (16)
#define COEFF_FRACT (12)
#define COEFF_SCALE_FACTOR (1 << COEFF_FRACT)

void allocateImageBuffers(int width, int height);
void generateRandomImage(uint8_t *buf, int len);
void generateFilterKernel(float *floatInputKernel, float kernelScaleFactor, float *floatOutputKernel, int32_t *intOutputKernel);
void convolutionFilter(float *kernel, int radius, uint8_t *in, uint8_t *out, int width, int height);

#endif
