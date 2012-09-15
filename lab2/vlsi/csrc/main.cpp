#include <DirectC.h>

#include <stdio.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <stdint.h>
#include <assert.h>
#include <stdlib.h>

#include "median.h"
#define IMAGE_HEIGHT (128)
#define IMAGE_WIDTH (128)

extern "C" {

static uint8_t inputImage[IMAGE_HEIGHT * IMAGE_WIDTH];
static uint8_t outputImage[IMAGE_HEIGHT * IMAGE_WIDTH];
static int imageSize = 0;

  void generate_image()
  {
    imageSize = IMAGE_HEIGHT*IMAGE_WIDTH;
    for (int i=0;i<imageSize;i++)
      inputImage[i] = (uint8_t) rand();
    
    medianFilter(inputImage, outputImage, 1, IMAGE_HEIGHT, IMAGE_WIDTH);
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
