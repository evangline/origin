#include "GCD.h"

// uncomment next line to enable trace output
#define DEBUG

// Define test vectors
// Could also read these from a file, or generate using a script
static uint32_t src[][2]  = { {15, 27} , { 49, 21 }, { 30, 25 }, { 27, 19 }, { 40, 40 }, { 190, 250 }, { 250, 5 }, { 0, 0 } };
static uint32_t sink[] = { 3, 7, 5, 1, 40, 10, 5, 0 };

int main (int argc, char* argv[]) {
  // Load our design
  GCD_t* c = new GCD_t();

  // Max number of clock cycles to simulate before exiting
  int lim = 1000;

  // initialization
  c->init();

  uint32_t num_tests = sizeof(sink) / sizeof(uint32_t);
  uint32_t testCount = 0;

  int cycle;
  int done = 0;
  // Every loop is one clock cycle
  for (cycle = 0; lim < 0 || cycle < lim && !done ; cycle++) {

    dat_t<1> reset = LIT<1>(cycle==0);

    // Set input ports to test vector values
    c->GCD__io_operands_bits_A = LIT<16>(src[testCount][1]);
    c->GCD__io_operands_bits_B = LIT<16>(src[testCount][0]);

    // assert operands_val as long as there are still tests to run
    c->GCD__io_operands_val = LIT<1>(testCount < num_tests);

    // always ready for output
    c->GCD__io_result_rdy = LIT<1>(1);

    // Evaluate the data
    // Note: this is the same as a positive edge clock tick occuring
    // Note: C testbench is not combinational, so we can't check a value
    // from GCD, and based off of that, prepare an input and have it
    // flow through the logic in the same cycle.
    // Therefore, we will advance the input operands immediately after
    // the DUT says that they are received (instead of advancing the operands
    // when result_val goes high, becaues by then it is too late)
    // This only matters if result_val, and operands_rdy can go high on the
    // same cycle

    c->clock_lo(reset);

    // Check result and print
    if((c->GCD__io_result_val.lo_word() == 1) && (testCount > 0))
    {
      uint32_t result_bits = c->GCD__io_result_bits_data.lo_word();

      if (result_bits == sink[testCount-1]) 
      {
        printf("[Passed] Test #%d: GCD(%d,%d)=%d\n",testCount,src[testCount-1][1],src[testCount-1][0],result_bits);
      } 
      else 
      {
        printf("[Failed]\n");
        printf("Reason: %d != %d\n",result_bits,sink[testCount-1]);
      }

      // Quit if done with all tests
      if(testCount == num_tests)
        done=1;

    }

    // Start next test once DUT gets data
    if((c->GCD__io_operands_rdy.lo_word() == 1) && (reset.lo_word() == 0))
      testCount++;

    c->clock_hi(reset);

    // Print trace for debugging
    // Variables that hold signal values named like:
    // c->GCD__signalname.lo_word() 
    // where signalname is a (mangled) name of a signal inside your Chisel code
    // look in generated-src/GCD.h to see all variables associated with signals
    
#ifdef DEBUG
//  Print the values of the input and output signals
    uint32_t operands_val = c->GCD__io_operands_val.lo_word();
    uint32_t operands_rdy = c->GCD__io_operands_rdy.lo_word();
    uint32_t result_val   = c->GCD__io_result_val.lo_word();
    uint32_t result_rdy   = c->GCD__io_result_rdy.lo_word();
    uint32_t result_bits  = c->GCD__io_result_bits_data.lo_word();
    uint32_t A_in         = c->GCD__io_operands_bits_A.lo_word();
    uint32_t B_in         = c->GCD__io_operands_bits_B.lo_word();

    printf("cycle: %d\t operands_val: %d\t operands_rdy: %d\t A_in: %d\t B_in: %d\t result_val: %d\t result_rdy: %d\t result_bits: %d\n", \
        cycle, operands_val, operands_rdy, A_in, B_in, result_val, result_rdy, result_bits);

//    printf("reset: %d\t operands_val: %d\t operands_rdy: %d\t A_in: %d\t B_in: %d\t result_val: %d\t, result_rdy: %d\t results_bits: %d\t\n", \
        reset.lo_word(), operands_val, operands_rdy, A_in, B_in, result_val, result_rdy, result_bits);

//    Add internal signals here, if you want to see them
//    these are just examples, your code probably won't have signals named
//    like these

//    uint32_t A_reg        = c->GCD_A_reg.lo_word();
//    uint32_t B_reg        = c->GCD_B_reg.lo_word();
//    uint32_t A_reg_next   = c->GCD_A_reg_shadow.lo_word();
//    uint32_t B_reg_next   = c->GCD_B_reg_shadow.lo_word();
//    uint32_t state        = c->GCD_state.lo_word();
//    uint32_t first        = c->GCD_first.lo_word();

//    add a printf here to see the signals
#endif
 }

 if(done)
 {
    printf("All tests passed, simulation finished after %d cycles.\n", cycle);
    return 0;
 }

  printf("[Failed] Timed out after %d cycles!\n", cycle);
  return -1;
}
