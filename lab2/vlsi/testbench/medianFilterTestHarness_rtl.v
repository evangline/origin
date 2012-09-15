extern void generate_image();
extern void get_input_pixel  (input reg [31:0] offset, output reg [31:0] dout);
extern void get_output_pixel (input reg [31:0] offset, output reg [31:0] dout);

`define IMAGE_SIZE (128*128)

module medianFilterTestHarness_rtl;

  reg clk = 0;
  always #`CLOCK_PERIOD clk = ~clk;


  reg  reset, reset_ext;

  always @(posedge clk)
    reset <= reset_ext;

//  wire frame_sync_in, frame_sync_out;
//  wire [7:0] data_in, data_out;
 
  reg frame_sync_in = 1'b0;
  reg [7:0] data_in = 8'd0;
  wire [7:0] data_out;
  wire frame_sync_out;

  medianFilter median_filter
  ( 
    .clk              (clk),
    .reset            (reset),

    .io_frame_sync_in    (frame_sync_in),
    .io_data_in          (data_in),

    .io_frame_sync_out    (frame_sync_out),
    .io_data_out          (data_out)
  );

  //--------------------------------------------------------------------
  // Run tests
  //--------------------------------------------------------------------

  reg started = 1'b0;
  reg [31:0] input_offset = 32'd0;
  reg [31:0] output_offset = 32'd0;
  reg [31:0] correct_dout = 32'd0;
  reg [31:0] cycle_count = 32'd0;

  reg [31:0] max_cycles;
  reg [31:0] data_in_reg;

  always @(posedge clk)
  begin
    cycle_count <= cycle_count + 1;

    if (cycle_count == 1)
    begin
      frame_sync_in <= 1'b1;
      get_input_pixel(input_offset, data_in_reg);
      data_in <= data_in_reg[7:0];
      input_offset <= input_offset + 1;
    end
    else if (cycle_count > 1)
    begin
      frame_sync_in <= 1'b0;
      get_input_pixel(input_offset, data_in_reg);
      data_in <= data_in_reg[7:0];
      input_offset <= input_offset + 1;
    end


    if (frame_sync_out)
      started <= 1'b1;

    if (started || frame_sync_out)
    begin
      get_output_pixel(output_offset, correct_dout);
      if (data_out != correct_dout[7:0])
        $display("ERROR: Mismatch at cycle %d : expected %03d : actual %03d", cycle_count, correct_dout, data_out);

      output_offset <= output_offset + 1;
    end
  end

  initial
  begin
    $vcdpluson(0);

    generate_image();

    // Get max number of cycles to run simulation for from command line
    if (!$value$plusargs("max-cycles=%d", max_cycles))
      max_cycles = 1000;

    // Stobe reset
        reset_ext = 1;
    #5 reset_ext = 0;

//    #2000 $vcdplusoff;
  end

  // time out after max_cycles
  always @(*)
  begin
    if (cycle_count > max_cycles)
    begin
      $display("*** FAILED *** (timeout)");
      $finish;
   end
  end

endmodule
