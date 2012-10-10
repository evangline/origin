#include <DirectC.h>

#include <stdio.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <stdint.h>
#include <assert.h>
#include <stdlib.h>

#include "convolution.h"

extern "C" {
  extern float* filterKernels[];
  extern float  filterScales[];
  extern int filterCount;
  
  extern float floatKernel[WINDOW_SIZE];
  extern int32_t intKernel[WINDOW_SIZE];
  
  extern uint8_t *inputImageBuffer, *outputImageBuffer;
  extern int imageWidth, imageHeight, imageBufferSize;

  static int kernelCount = 0;

  void initialize_image_buffers(const vec32* width, const vec32* height)
  {
    assert((width->c == 0) && (height->c == 0));
    imageWidth = width->d;
    imageHeight = height->d;
    allocateImageBuffers(imageWidth, imageHeight);
    generateFilterKernel(filterKernels[kernelCount], filterScales[kernelCount], floatKernel, intKernel);
    kernelCount++;
  }

  void get_conv_mask(const vec32* offset, /* OUTPUT*/ vec32 *dout)
  {
    assert(imageBufferSize > 0);
    if (offset->c != 0) // x's or z's on the input signal
    {
      dout->c = 0xFFFFFFFF;
      dout->d = 0;
    }
    else
    {
      assert(offset->d < WINDOW_SIZE);
      dout->c = 0;
      dout->d = intKernel[offset->d];
    }
  }

  void generate_input_image()
  {
    assert(imageBufferSize > 0);
    generateRandomImage(inputImageBuffer, imageBufferSize);
  }

  void generate_output_image()
  {
    assert(imageBufferSize > 0);
    convolutionFilter(floatKernel, 2, inputImageBuffer, outputImageBuffer, imageWidth, imageHeight);
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
      assert(offset->d < imageBufferSize);
      dout->c = 0;
      dout->d = inputImageBuffer[offset->d];
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
      assert(offset->d < imageBufferSize);
      dout->c = 0;
      dout->d = outputImageBuffer[offset->d];
    }
  }

}
