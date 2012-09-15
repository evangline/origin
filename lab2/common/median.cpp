#include "median.h"
#include <assert.h>
#include <string.h>
#include <stdio.h>
#include <stdlib.h>

uint8_t getMedian(uint8_t *data, int len)
{
  // only odd-length sequences
  assert (len % 2 == 1);
  uint8_t buf[len];
  memcpy(buf, data, len);

  for (int i=0;i<=len/2;i++)
  {
    int min = buf[i];
    int pos = i;
    for (int j=i;j<len;j++)
    {
      if (buf[j] < min)
      {
        min = buf[j];
        pos = j;
      }
    }

    if (pos != i)
    {
      uint8_t temp = buf[i];
      buf[i] = buf[pos];
      buf[pos] = temp;
    }
  }
  return buf[len/2];
}

void medianFilter(uint8_t *in, uint8_t *out, int radius, int width, int height)
{
  int diameter = 2*radius+1;
  int windowsize = diameter*diameter;
  uint8_t window[windowsize];

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
    // copy first and last pixels in each line from input to output
    for (int x=0; x<radius;x++)
    {
      int offset = x+y*width;
      out[offset] = in[offset];
      offset += width - 1 - x;
      out[offset] = in[offset];
    }

    for (int x=1; x<width-1; x++)
    {
      // copy values from input buffer to window buffer
      int pos = 0;
      for (int yy=0;yy<diameter;yy++)
        for (int xx=0;xx<diameter;xx++)
          window[pos++] = in[(x+xx-1) + ((y+yy-1)*width)];

      // find median
      out[x+y*width] = getMedian(window, windowsize);
    }
  }
  
}

