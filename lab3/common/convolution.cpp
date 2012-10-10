#include "convolution.h"
#include <assert.h>

float gaussianKernel5x5[] = \
  { 2.0,  4.0,  5.0,  4.0, 2.0, \
    4.0,  9.0, 12.0,  9.0, 4.0, \
    5.0, 12.0, 15.0, 12.0, 5.0, \
    4.0,  9.0, 12.0,  9.0, 4.0, \
    2.0,  4.0,  5.0,  4.0, 2.0 };

float laplacianKernel5x5[] = \
  { -4.0, -1.0, 0.0, -1.0, -4.0, \
    -1.0,  2.0, 3.0,  2.0, -1.0, \
     0.0,  3.0, 4.0,  3.0,  0.0, \
    -1.0,  2.0, 3.0,  2.0, -1.0, \
    -4.0, -1.0, 0.0, -1.0, -4.0 };

float* filterKernels[] = { gaussianKernel5x5, laplacianKernel5x5 };
float  filterScales[]  = { 115.0, 1.0 };
int filterCount = sizeof(filterKernels)/sizeof(float*);

float floatKernel[WINDOW_SIZE];
int32_t intKernel[WINDOW_SIZE];

uint32_t imageWidth, imageHeight, imageBufferSize = 0;
uint8_t *inputImageBuffer = 0;
uint8_t *outputImageBuffer = 0;

void allocateImageBuffers(int width, int height)
{
  if (inputImageBuffer)
    free(inputImageBuffer);
  if (outputImageBuffer)
    free(outputImageBuffer);

  imageBufferSize = width*height;

  inputImageBuffer = (uint8_t*) malloc(imageBufferSize);
  assert(inputImageBuffer);
  outputImageBuffer = (uint8_t*) malloc(imageBufferSize);
  assert(outputImageBuffer);
}

void generateRandomImage(uint8_t *buf, int len)
{
  for (int i=0;i<len;i++)
    buf[i] = (uint8_t) rand();
}

void generateFilterKernel(float *floatInputKernel, float kernelScaleFactor, float *floatOutputKernel, int32_t *intOutputKernel)
{
  float ftmp;
  for (int i=0;i<WINDOW_SIZE;i++)
  {
    ftmp = floatInputKernel[i] / kernelScaleFactor;
    intOutputKernel[i] = ftmp * COEFF_SCALE_FACTOR;
    floatOutputKernel[i] = ((float)intOutputKernel[i]) / COEFF_SCALE_FACTOR;
  }
}

void convolutionFilter(float *kernel, int radius, uint8_t *in, uint8_t *out, int width, int height)
{
  // copy top and bottom lines from input to output unchanged
  for (int y=0; y<radius; y++)
    for (int x=0; x<width; x++)
    {
      out[x+y*width] = in[x+y*width];
      int offset = (height-1-y)*width;
      out[x+offset] = in[x+offset];
    }

  for (int y=radius; y<height-radius; y++)
  {
    // copy first and last pixels in each line from input to output unchanged
    int offset=y*width;
    for (int i=0;i<radius;i++) {
      out[offset+i] = in[offset+i];
      out[offset+width-(i+1)] = in[offset+width-(i+1)];
    }

    for (int x=radius; x<width-radius; x++)
    {
      float outputFloat = 0;
      int pos = 0;
      int diameter = 2*radius+1;
      for (int yy=0;yy<diameter;yy++)
        for (int xx=0;xx<diameter;xx++)
          outputFloat += ((float)(in[(x+xx-radius) + ((y+yy-radius)*width)])) * kernel[pos++];

      uint8_t output;
      if (outputFloat+0.5 > 255.0)
        output = 255;
      else if (outputFloat < 0)
        output = 0;
      else
        output = (uint8_t)(outputFloat+0.5);

      out[x+y*width] = output;
    }
  }
}
