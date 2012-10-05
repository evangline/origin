#include "convolutionFilter.h"
#include "convolutionFilter-emulator.h"
#include "convolution.h"

#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <assert.h>
#include <ctype.h>
#include <unistd.h>
#include <errno.h>

#define DEFAULT_IMAGEHEIGHT (128)
#define DEFAULT_IMAGEWIDTH (128)
#define DEFAULT_NUM_IMAGES (2)

void generateInputImage(uint8_t *buf, int len)
{
  for (int i=0;i<len;i++)
    buf[i] = (uint8_t) rand();
}

int main (int argc, char* argv[]) {
  int cycle;
  int lim = 0;
  int done = 0;
  int fail = 0;
  int imageFailed = 0;
  int inputOffset = -1;
  int outputOffset = -1;
  int imageCount = 0;
  uint8_t dout_expected = 0;
  int dout_mismatch = 0;
  float floatKernel[WINDOW_SIZE];
  int32_t kernel[WINDOW_SIZE];
  for (int i=0;i<WINDOW_SIZE;i++)
  {
    floatKernel[i] = FILTER_KERNEL[i] / KERNEL_SCALE_FACTOR;
    kernel[i] = floatKernel[i] * COEFF_SCALE;
//    printf("kernel[%d] = %0.4f = %d = 0x%04x\n", i, floatKernel[i],kernel[i],kernel[i] );
    floatKernel[i] = ((float)kernel[i]) / COEFF_SCALE;
//    printf("floatKernel[%d] = %0.4f\n", i, floatKernel[i]);
  }

  // set default values
  int imageHeight = DEFAULT_IMAGEHEIGHT;
  int imageWidth = DEFAULT_IMAGEWIDTH;
  int numImages = DEFAULT_NUM_IMAGES;
  int print_trace = 0;
  int generate_vcd = 0;
  FILE *vcdFile = NULL;
  const char *vcdFileName = "trace.vcd";

  // parse command line options
  int ch;
  char *cvalue = NULL;
  opterr = 0;
  while ((ch = getopt(argc,argv,"l:h:n:tvw:")) != -1)
  {
    switch(ch)
    {
      // specify image height
      case 'h':
        errno = 0;
        imageHeight = strtol(optarg, NULL, 10);
        if (errno != 0 && imageHeight == 0)
        {
          printf("-h command line option requires an integer argument!\n");
          return -1;
        }
        break;
      // specify cycle limit for simulation
      case 'l':
        errno = 0;
        lim = strtol(optarg, NULL, 10);
        if (errno != 0 && lim == 0)
        {
          printf("-l command line option requires an integer argument!\n");
          return -1;
        }
        break;
      // specify number of images to simulate
      case 'n':
        errno = 0;
        numImages = strtol(optarg, NULL, 10);
        if (errno != 0 && numImages == 0)
        {
          printf("-n command line option requires an integer argument!\n");
          return -1;
        }
        break;
      // enable text trace output
      case 't':
        print_trace = 1;
        break;
      // enable vcd file generation
      case 'v':
        generate_vcd = 1;
        break;
      // specify image width
      case 'w':
        errno = 0;
        imageWidth = strtol(optarg, NULL, 10);
        if (errno != 0 && imageWidth == 0)
        {
          printf("-h command line option requires an integer argument!\n");
          return -1;
        }
        break;
    case '?':
        if (optopt == 'n')
          printf("Option -%c requires an argument.\n", optopt);
        else if (isprint(optopt))
          printf("Unknown command line option '-%c'.\n", optopt);
        return -1;
    default:
        return -1;
    }
  }

  int imageBufferSize = imageHeight*imageWidth;

  // number of clock cycles to simulate before exiting
  // if not specified on command line, set based on number
  // of images in simulation
  if (lim == 0)
    lim = (numImages*imageBufferSize) + (imageWidth*3);
 
  // allocate input/output image buffers
  uint8_t *inputBuffer = (uint8_t*) malloc(imageBufferSize);
  assert(inputBuffer);
  uint8_t *outputBuffer = (uint8_t*) malloc(imageBufferSize);
  assert(outputBuffer);

  // Instantiate and initialize top level Chisel module
  convolutionFilter_t* dut = new convolutionFilter_t();
  dut->init();

  printf("Image dimensions : %d x %d\n", imageWidth, imageHeight);
  printf("Number of images to be simulated: %d\n", numImages);
  printf("Simulation will timeout after %d clock cycles.\n", lim);
  if (generate_vcd)
    printf("VCD generation enabled, output filename = %s\n", vcdFileName);

  // Start simulation
  // Every loop iteration simulates one clock cycle
  for (cycle = 0; lim < 0 || cycle < lim && !done ; cycle++) {
    // assert reset for 1 cycle at start of simulation
    dat_t<1> reset = LIT<1>(cycle==0);

    // open VCD trace dump file, if option enabled
    if (cycle == 0 && generate_vcd)
    {
      vcdFile = fopen(vcdFileName, "w");
      if (vcdFile == NULL)
      {
        printf("Error opening trace output file %s.\n", vcdFileName);
        perror("fopen: ");
        return -1;
      }
      // add some extra signals to the vcd file to help debugging
      fprintf(vcdFile, "$scope module convolutionFilterTestHarness $end\n");
      fprintf(vcdFile, "$var reg 32 NCYCLE cycle $end\n");
      fprintf(vcdFile, "$var reg 8 EXPECTED dout_expected $end\n");
      fprintf(vcdFile, "$var reg 8 MISMATCH dout_mismatch $end\n");
      fprintf(vcdFile, "$upscope $end\n");
    }

    // Set input ports to test vector values
    dut->convolutionFilter__io_image_width = LIT<10>(imageWidth-1);
    dut->convolutionFilter__io_image_height = LIT<10>(imageHeight-1);
   
    // load coefficient values before starting to process images
    int32_t coeff = (cycle > 0 && cycle <= 25) ? kernel[cycle-1] : 0;
    dut->convolutionFilter__io_config_load = LIT<1>(cycle > 0 && cycle <= 25);
    dut->convolutionFilter__io_coeff_in = LIT<COEFF_WIDTH>(coeff);

    if (cycle <= 25)
    {
      dut->convolutionFilter__io_data_in   = LIT<8>(0);
      dut->convolutionFilter__io_frame_sync_in = LIT<1>(0);
      inputOffset = 0;
    }
    else
    {
      if (inputOffset == 0)
      {
        // generate new input image, assert frame_sync_in
        generateInputImage(inputBuffer, imageBufferSize);
        dut->convolutionFilter__io_frame_sync_in = LIT<1>(1);
      }
      else
        dut->convolutionFilter__io_frame_sync_in = LIT<1>(0);
        
      dut->convolutionFilter__io_data_in  = LIT<8>(inputBuffer[inputOffset]);

      if (inputOffset == imageBufferSize-1)
        inputOffset = 0;
      else
        inputOffset++;
    }

    // advance simulation
    dut->clock_lo(reset);
 
    // examine output port values
    // if frame_sync_out is asserted, start verification
    if (dut->convolutionFilter__io_frame_sync_out.lo_word())
    {
      // generated expected output image for current input
      convolutionFilter(floatKernel, 2, inputBuffer, outputBuffer, imageWidth, imageHeight);
      outputOffset = 0;
    }

    if (outputOffset >= 0 && outputOffset < imageBufferSize)
    {
      uint8_t dout = (uint8_t) dut->convolutionFilter__io_data_out.lo_word();
      dout_expected = outputBuffer[outputOffset];
      dout_mismatch = 0;
      if (dout != dout_expected)
      {
        printf("Verification failed at cycle %6d! pixel at offset %5d expected: %02x actual: %02x \n", cycle, outputOffset, dout_expected, dout);
        fail = 1;
        imageFailed = 1;
        dout_mismatch = 1;
      }

      // end of image
      if(outputOffset == imageBufferSize-1)
      {
        imageCount++;
        if (!imageFailed)
          printf("[PASSED] Image %d processed succesfully.\n", imageCount);
        else
          printf("[FAILED] Filter output for input image %d was incorrect!\n", imageCount);
  
        imageFailed = 0;
        outputOffset = 0;
        if (imageCount == numImages)
          done=1;
      }
      else
        outputOffset++;
    }

    if (print_trace) {
      // Print the values of the input and output signals
      uint32_t frame_sync_in  = dut->convolutionFilter__io_frame_sync_in.lo_word();
      uint32_t data_in        = dut->convolutionFilter__io_data_in.lo_word();
      uint32_t config_load     = dut->convolutionFilter__io_config_load.lo_word();
      uint32_t coeff_in       = dut->convolutionFilter__io_coeff_in.lo_word();
      // outputs
      uint32_t frame_sync_out = dut->convolutionFilter__io_frame_sync_out.lo_word();
      uint32_t data_out       = dut->convolutionFilter__io_data_out.lo_word();
  
      printf("cycle: %04d config_load: %d coeff_in: %05x frame_sync_in: %d data_in: %02x frame_sync_out: %d data_out: %02x\n", \
          cycle, config_load, coeff_in, frame_sync_in, data_in, frame_sync_out, data_out);
    }

    // write trace output to VCD file
    if (generate_vcd)
    {
      dut->dump(vcdFile, cycle);
      // add extra signals for debugging
      // cycle count
      dat_dump(vcdFile, dat_t<32>(cycle), "NCYCLE");
      // expected value (for verification)
      dat_dump(vcdFile, dat_t<8>(dout_expected), "EXPECTED");
      // mismatch signal (high when output doesn't match expected output)
      dat_dump(vcdFile, dat_t<1>(dout_mismatch), "MISMATCH");
    }

    // advance simulation
    dut->clock_hi(reset);
  }

  free(inputBuffer);
  free(outputBuffer);

  if (generate_vcd)
    fclose(vcdFile);

  if(fail)
  {
     printf("Failed test! Simulation ended after %d cycles.\n", cycle);
     return -1;
  }

  if(done)
  {
     printf("All tests passed, simulation finished after %d cycles.\n", cycle);
     return 0;
  }

  printf("[Failed] Timed out after %d cycles!\n", cycle);
  return -1;
}
