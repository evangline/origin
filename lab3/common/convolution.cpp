#include "convolution.h"

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
