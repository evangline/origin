//#include "../generated-src/GCD.h"
#include "GCD.h"

int main (int argc, char* argv[]) {
  // Load our design
  GCD_t* c = new GCD_t();
  // Limit of cycles (increase if not finishing test)
  int lim = 1000;
  c->init();

  // Define test vectors
  // Can also read these from a file, or use a script to generate
  // this text
  uint32_t num_tests = 8;
  uint32_t src[num_tests][2]; uint32_t sink[num_tests];
  src[0][1] = 27; src[0][0] = 15; sink[0] = 3;
  src[1][1] = 21; src[1][0] = 49; sink[1] = 7;
  src[2][1] = 25; src[2][0] = 30; sink[2] = 5;
  src[3][1] = 19; src[3][0] = 27; sink[3] = 1;
  src[4][1] = 40; src[4][0] = 40; sink[4] = 40;
  src[5][1] = 250; src[5][0] = 190; sink[5] = 10;
  src[6][1] = 5; src[6][0] = 250; sink[6] = 5;
  src[7][1] = 0; src[7][0] = 0; sink[7] = 0;
  uint32_t testCount = 0;

  // Every loop is a cycle
  for (int t = 0; lim < 0 || t < lim; t++) {

    dat_t<1> reset = LIT<1>(t==0);

    // input is always valid
    c->GCD__io_operands_val = LIT<1>(1);

    // Run tests
    // Set test vector at input
    c->GCD__io_operands_bits_A = LIT<16>(src[testCount][1]);
    c->GCD__io_operands_bits_B = LIT<16>(src[testCount][0]);
    c->GCD__io_operands_val = LIT<1>(1);

    // Evaluate the data
    // Note: this is the same as a positive edge clock tick occuring
    // Note: C testbench is not combinational, so we can't check a value
    // from GCD, and based off of that, prepare an input and have it
    // flow through the logic in the same cycle.
    // Therefore, we will advance the input operands immediately after
    // the DUT says that they are received (instead of advancing the operands
    // when results_val goes high, becaues by then it is too late)
    // This only matters if results_val, and operands_rdy can go high on the
    // same cycle
    c->clock_lo(reset);

    // Check result and print
    if((c->GCD__io_results_val.lo_word() == 1) && (testCount > 0)){
      uint32_t results_bits = c->GCD__io_results_bits_data.lo_word();
      if (results_bits == sink[testCount-1]) {
        printf("[Passed] Test #%d: GCD(%d,%d)=%d\n",testCount,src[testCount-1][1],src[testCount-1][0],results_bits);
      } else {
        printf("[Failed]\n");
        printf("Reason: %d != %d\n",results_bits,sink[testCount-1]);
      }
      // Quit if done with all tests
      if(testCount == num_tests){ return 0; }
    }

    // Start next test once DUT gets data
    if((c->GCD__io_operands_rdy.lo_word() == 1) && (reset.lo_word() == 0)){
    testCount = testCount + 1;
    }

    // Print debugging code (uncomment to enable)
    // If possible additional signal names are commended out.
    // Format will be c->GCD_signalname.lo_word() where signalname
    // is the name given in Chisel
  /*
    uint32_t operands_val = c->GCD__io_operands_val.lo_word();
    uint32_t operands_rdy = c->GCD__io_operands_rdy.lo_word();
    uint32_t results_val = c->GCD__io_results_val.lo_word();
    uint32_t results_bits = c->GCD__io_results_bits_data.lo_word();
    uint32_t A_in = c->GCD__io_operands_bits_A.lo_word();
    uint32_t B_in = c->GCD__io_operands_bits_B.lo_word();

    uint32_t A_reg = c->GCD_A_reg.lo_word();
    uint32_t B_reg = c->GCD_B_reg.lo_word();
    uint32_t A_reg_next = c->GCD_A_reg_shadow.lo_word();
    uint32_t B_reg_next = c->GCD_B_reg_shadow.lo_word();
    //uint32_t state = c->GCD_state.lo_word();
    //uint32_t first = c->GCD_first.lo_word();
    
    //printf("State: %d, Inval: %d, Inrdy: %d, A_in: %d, B_in: %d,  A: %d; B: %d; result_val: %d; result:%d\n",state,operands_val,operands_rdy,A_in,B_in,A_reg,B_reg,results_val, results_bits);
    printf("Reset: %d, operands_val: %d, operands_rdy: %d, A_in: %d, B_in: %d,  A: %d (next: %d); B: %d (next: %d); result_val: %d; result:%d\n",reset.lo_word(),operands_val,operands_rdy,A_in,B_in,A_reg,A_reg_next,B_reg,B_reg_next,results_val, results_bits);

    */
    // Next stage
    c->clock_hi(reset);

  }
}
