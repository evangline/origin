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

#define DEFAULT_IMAGE_HEIGHT (128)
#define DEFAULT_IMAGE_WIDTH (128)
#define DEFAULT_NUM_IMAGES (4)

extern float* filterKernels[];
extern float  filterScales[];
extern int filterCount;
extern uint8_t *inputImageBuffer, *outputImageBuffer;
extern int imageWidth, imageHeight, imageBufferSize;
extern float floatKernel[WINDOW_SIZE];
extern int32_t intKernel[WINDOW_SIZE];

int main (int argc, char* argv[]) {
  int cycle;
  int lim = 0;
  int done = 0;
  int fail = 0;
  int imageFailed = 0;
  uint8_t dout_expected = 0;
  int  dout_mismatch = 0;

  // set default values
  imageHeight = DEFAULT_IMAGE_HEIGHT;
  imageWidth  = DEFAULT_IMAGE_WIDTH;
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

  // for loading of filter kernels
  int loadKernel = 1;
  int loadKernelOffset = 0;
  int loadKernelCount = 0;

  // for loading of input images
  int loadImage = 0;
  int loadImageOffset = 0;
  int loadImageCount = 0;

  // for checking of output images 
  int checkOutput = 0;
  int checkOutputOffset = 0;
  int checkOutputCount = 0;

  // number of clock cycles to simulate before exiting
  // if not specified on command line, set based on number
  // of images in simulation
  if (lim == 0)
    lim = numImages*((imageWidth+72)*(imageHeight-28)+WINDOW_SIZE+imageWidth*3);
 
  // Instantiate and initialize top level Chisel module
  convolutionFilter_t* dut = new convolutionFilter_t();
  dut->init();

  printf("Number of images to simulate: %d\n", numImages);
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

    // Set input port values
    // handle input image loading
    uint32_t io_frame_sync_in = 0;
    uint8_t  io_data_in = 0;
    if (loadImage)
    {
      if (loadImageOffset == 0)
      { 
        generateRandomImage(inputImageBuffer, imageBufferSize);
        printf("[STATUS] Loading image %d, dimensions : %d x %d\n", loadImageCount+1, imageWidth, imageHeight);
        io_frame_sync_in = 1;
      }
      io_data_in = inputImageBuffer[loadImageOffset++];
      if (loadImageOffset == imageBufferSize)
      {
        loadImageCount++;
        loadImageOffset = 0;
        // load new filter kernel for second set of images
        if ((loadImageCount == numImages/2) || (loadImageCount == numImages))
          loadImage = 0;
        else
          loadImage = 1;
      }
    }

    dut->convolutionFilter__io_data_in   = LIT<8>(io_data_in);
    dut->convolutionFilter__io_frame_sync_in = LIT<1>(io_frame_sync_in);

    // handle configuration (filter coefficient + image dimension setup)
    uint32_t io_config_load = 0;
    int32_t  io_coeff_in = 0;
    if (loadKernel) {
      if (loadKernelOffset == 0) {
        printf("[STATUS] Loading filter coefficients...\n");
        assert(loadKernelCount < filterCount);
        // generate coefficient values
        generateFilterKernel(filterKernels[loadKernelCount], filterScales[loadKernelCount], floatKernel, intKernel);
      } 
      io_config_load = 1;
      io_coeff_in = intKernel[loadKernelOffset++];
      if (loadKernelOffset == WINDOW_SIZE) {
        loadKernel = 0;
        loadKernelOffset = 0;
        loadKernelCount++;
        // change size for second set of images
        if (loadKernelCount == 2) {
          // will set to 200 x 100 for default image size (128x128)
          imageWidth  += 72;
          imageHeight -= 28;
        }
        // start streaming in an image once coefficients are set
        allocateImageBuffers(imageWidth, imageHeight);
        loadImage = 1;
        loadImageOffset = 0;
      }
    }

    dut->convolutionFilter__io_image_width = LIT<10>(imageWidth-1);
    dut->convolutionFilter__io_image_height = LIT<10>(imageHeight-1);
    dut->convolutionFilter__io_config_load = LIT<1>(io_config_load);
    dut->convolutionFilter__io_coeff_in = LIT<COEFF_WIDTH>(io_coeff_in);

    // advance simulation
    dut->clock_lo(reset);
 
    // examine output port values
    // if frame_sync_out is asserted, start verification
    if (dut->convolutionFilter__io_frame_sync_out.lo_word())
    {
      // generated expected output image for current input
      convolutionFilter(floatKernel, 2, inputImageBuffer, outputImageBuffer, imageWidth, imageHeight);
      checkOutput = 1;
      checkOutputOffset = 0;
    }

    if (checkOutput)
    {
      uint8_t dout = (uint8_t) dut->convolutionFilter__io_data_out.lo_word();
      dout_expected = outputImageBuffer[checkOutputOffset];
      dout_mismatch = 0;
      if (dout != dout_expected)
      {
        printf("Verification failed at cycle %6d! pixel at offset %5d expected: %02x actual: %02x \n", cycle, checkOutputOffset, dout_expected, dout);
        fail = 1;
        imageFailed = 1;
        dout_mismatch = 1;
      }

      // end of image
      if(checkOutputOffset == imageBufferSize-1)
      {
        checkOutputCount++;
        if (!imageFailed)
          printf("[PASSED] Image %d processed succesfully.\n", checkOutputCount);
        else
          printf("[FAILED] Filter output for input image %d was incorrect!\n", checkOutputCount);
  
        imageFailed = 0;
        checkOutputOffset = 0;
        checkOutput = 1;
        
        if (checkOutputCount == numImages/2)
        {
          checkOutput = 0;
          loadKernel = 1;
          loadKernelOffset = 0;
        }
        else if (checkOutputCount == numImages)
          done=1;

      }
      else
        checkOutputOffset++;
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

  if (generate_vcd)
    fclose(vcdFile);

  free(inputImageBuffer);
  free(outputImageBuffer);

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
