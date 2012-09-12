#include "medianFilter.h"
#include "medianFilter-emulator.h"

#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <assert.h>

#define IMAGE_HEIGHT (128)
#define IMAGE_WIDTH (128)

// uncomment next line to enable trace output
// #define DEBUG

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

uint8_t *medianFilter3x3(uint8_t *in, int width, int height)
{
  uint8_t *buf = (uint8_t*) malloc(width*height);
  uint8_t window[9];
  assert(buf);

  // copy top and bottom lines from input to output unchanged
  for (int x=0; x<width; x++)
  {
    int offset = (height-1)*width;
    buf[x] = in[x]; 
    buf[x+offset] = in[x+offset];
  }

  for (int y=1; y<height-1; y++)
  {
    // copy first and last pixel in each line from input to output
    int offset = y*width;
    buf[offset] = in[offset];
    buf[offset+width-1] = in[offset+width-1];

    for (int x=1; x<width-1; x++)
    {
      // copy values from input buffer to window buffer
      int pos = 0;
      for (int yy=0;yy<3;yy++)
        for (int xx=0;xx<3;xx++)
          window[pos++] = in[(x+xx-1) + ((y+yy-1)*width)];
      // find median
      uint8_t median = getMedian(window, 9);
      buf[x+y*width] = median;
    }
  }

  return buf;
}

int main (int argc, char* argv[]) {
  // Load our design
  medianFilter_t* c = new medianFilter_t();

  // Max number of clock cycles to simulate before exiting
  int lim = IMAGE_HEIGHT * IMAGE_WIDTH + IMAGE_WIDTH * 3;

  // initialization
  c->init();

  int cycle;
  int done = 0;
  int fail = 0;
  int pixelCount = -1;
  
  uint8_t *outputBuffer;

  int height = IMAGE_HEIGHT;
  int width = IMAGE_WIDTH;
  int frameBufferSize = height * width;
  uint8_t inputBuffer[frameBufferSize];
  for (int i=0;i<frameBufferSize;i++)
    inputBuffer[i] = (uint8_t) rand();

  // calculate correct output
  outputBuffer = medianFilter3x3(inputBuffer, width, height);

  // Start simulation
  // Every loop iteration simulates one clock cycle
  for (cycle = 0; lim < 0 || cycle < lim && !done ; cycle++) {

    dat_t<1> reset = LIT<1>(cycle==0);

    // Set input ports to test vector values
    
    c->medianFilter__io_frame_sync_in = LIT<1>(cycle % frameBufferSize == 1);
    if (cycle == 0)
      c->medianFilter__io_data_in   = LIT<8>(0);
    else
      c->medianFilter__io_data_in  = LIT<8>(inputBuffer[(cycle-1) % frameBufferSize]);

    c->clock_lo(reset);
   
    // look at outputs
    
    if (c->medianFilter__io_frame_sync_out.lo_word() == 1 && pixelCount == -1)
      pixelCount = 0;

    if (pixelCount != -1)
    {
      uint8_t dout = (uint8_t) c->medianFilter__io_data_out.lo_word();
      if (dout != outputBuffer[pixelCount])
      {
        printf("Test failed: pixel at offset %d\texpected: %d\tactual:%d\n", pixelCount, outputBuffer[pixelCount], dout);
        done = 1;
        fail = 1;
      }
      pixelCount++;
    }

    if(pixelCount == frameBufferSize-1)
      done=1;

#ifdef DEBUG
    // Print trace for debugging
    // Print the values of the input and output signals
    // inputs
    uint32_t frame_sync_in   = c->medianFilter__io_frame_sync_in.lo_word();
    uint32_t data_in      = c->medianFilter__io_data_in.lo_word();
    // outputs
    uint32_t frame_sync_out = c->medianFilter__io_frame_sync_out.lo_word();
    uint32_t data_out       = c->medianFilter__io_data_out.lo_word();

    printf("cycle: %04d frame_sync_in: %d data_in: %03d frame_sync_out: %d data_out: %03d", \
        cycle, frame_sync_in, data_in, frame_sync_out, data_out);
#endif

    c->clock_hi(reset);

  }

  if(fail)
  {
     printf("Failed test! Simulation ending after %d cycles.\n", cycle);
     return -1;
  }

  if(done && pixelCount > 0)
  {
     printf("All tests passed, simulation finished after %d cycles.\n", cycle);
     return 0;
  }

  printf("[Failed] Timed out after %d cycles!\n", cycle);
  return -1;
}
