#include <DirectC.h>

#include <stdio.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <stdint.h>
#include <assert.h>
#include <stdlib.h>

#include "convolution.h"
#define IMAGE_HEIGHT (128)
#define IMAGE_WIDTH (128)

extern "C" {

static uint8_t inputImage[IMAGE_HEIGHT * IMAGE_WIDTH];
static uint8_t outputImage[IMAGE_HEIGHT * IMAGE_WIDTH];
static int imageSize = 0;

  void get_conv_mask(const vec32* offset, /* OUTPUT*/ vec32 *dout)
  {
    if (offset->c != 0) // x's or z's on the input signal
    {
      dout->c = 0xFFFFFFFF;
      dout->d = 0;
    }
    else
    {
      assert(offset->d < WINDOW_SIZE);
      dout->c = 0;
      dout->d = (gaussianKernel5x5[offset->d]/KERNEL_SCALE_FACTOR) * COEFF_SCALE;
    }
  }

  void generate_input_image()
  {
    imageSize = IMAGE_HEIGHT*IMAGE_WIDTH;
    for (int i=0;i<imageSize;i++)
      inputImage[i] = (uint8_t) rand();
  }

  void generate_output_image()
  {
    assert(imageSize > 0);
    float floatKernel[WINDOW_SIZE];
    int32_t kernel[WINDOW_SIZE];
    for (int i=0;i<25;i++)
    {
      floatKernel[i] = gaussianKernel5x5[i] / KERNEL_SCALE_FACTOR;
      kernel[i] = floatKernel[i] * COEFF_SCALE;
      floatKernel[i] = ((float)kernel[i]) / COEFF_SCALE;
    }

    convolutionFilter(floatKernel, 2, inputImage, outputImage, IMAGE_WIDTH, IMAGE_HEIGHT);
  }

  void get_input_pixel(const vec32* offset, /* OUTPUT*/ vec32 *dout)
  {
    if (offset->c != 0) // x's or z's on the input signal
    {
      dout->c = 0xFFFFFFFF;
      dout->d = 0;
    }
    else
    {
      assert(offset->d < imageSize);
      dout->c = 0;
      dout->d = inputImage[offset->d];
    }
  }

  void get_output_pixel(const vec32* offset, /* OUTPUT*/ vec32 *dout)
  {
    if (offset->c != 0) // x's or z's on the input signal
    {
      dout->c = 0xFFFFFFFF;
      dout->d = 0;
    }
    else
    {
      assert(offset->d < imageSize);
      dout->c = 0;
      dout->d = outputImage[offset->d];
    }
  }

}
