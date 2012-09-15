extern void generate_input_image();
extern void generate_output_image();
extern void get_input_pixel  (input reg [31:0] offset, output reg [31:0] dout);
extern void get_output_pixel (input reg [31:0] offset, output reg [31:0] dout);

`define IMAGE_WIDTH (128)
`define IMAGE_HEIGHT (128)
`define IMAGE_SIZE (`IMAGE_WIDTH * `IMAGE_HEIGHT)

module medianFilterTestHarness_rtl;

  // clock signal
  reg clk = 0;
  always #`CLOCK_PERIOD clk = ~clk;

  // reset signal
  reg  reset, reset_ext;
  always @(posedge clk)
    reset <= reset_ext;

  // instantiate and connect median filter module
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

  // get command line options, initialize simulation
  reg [31:0] max_cycles;
  reg [31:0] num_images;

  initial
  begin
    // turn on VPD trace file generation
    $vcdpluson(0);

    // Get number of test images to try before finishing
    if (!$value$plusargs("num-images=%d", num_images))
      num_images = 1;

    // Get max number of cycles to run simulation for from command line
    // defaults to number neccessary to compute specified number of test
    // images
    if (!$value$plusargs("max-cycles=%d", max_cycles))
      max_cycles = (num_images * `IMAGE_SIZE) + (`IMAGE_WIDTH*3);

    // Strobe reset
    reset_ext = 1;
    #5 reset_ext = 0;

  end

  // cycle counter, completion and timeout checks
  reg [31:0] cycle_count = 32'd0;
  reg done = 1'b0;
  reg failed = 1'b0;
  always @(posedge clk)
  begin
    cycle_count <= cycle_count + 1;

    if (done)
    begin
      if (failed)
        $display("*** FAILED *** exiting after %d cycles", cycle_count);
      else
        $display("*** PASSED *** exiting after %d cycles", cycle_count);
      $finish;
    end

    if (cycle_count > max_cycles)
    begin
      $display("*** FAILED *** (timeout)");
      $finish;
   end
  end

  // generate input test vectors and verify design output
  // using DirectC function calls to get input and expected output
  // pixel values
  reg started = 1'b0;
  reg image_failed = 1'b0;
  reg [31:0] input_offset = 32'd0;
  reg [31:0] output_offset = 32'd0;
  reg [31:0] data_in_reg;
  reg [31:0] correct_dout = 32'd0;
  reg [31:0] image_count = 32'd0;

  always @(posedge clk)
  begin
    if (cycle_count > 0)
    begin
      if (input_offset == 0)
      begin
        // generate a new random test input image
        generate_input_image();
        frame_sync_in <= 1'b1;
      end
      else
        frame_sync_in <= 1'b0;

      // get value of input image at specified offset
      get_input_pixel(input_offset, data_in_reg);
      data_in <= data_in_reg[7:0];

      if (input_offset == `IMAGE_SIZE-1)
        input_offset <= 0;
      else
        input_offset <= input_offset + 1;

    end

    if (frame_sync_out && !started)
    begin
      // filter input image to produce expected output image
      generate_output_image();
      started <= 1'b1;
    end

    if (started || frame_sync_out)
    begin
      // get value of expected output image at specified offset
      get_output_pixel(output_offset, correct_dout);
      if (data_out != correct_dout[7:0])
      begin
        $display("ERROR: Mismatch at cycle %d : expected %03d : actual %03d", cycle_count, correct_dout, data_out);
        failed <= 1'b1;
        image_failed <= 1'b1;
      end

      if (output_offset == `IMAGE_SIZE-1)
      begin
        if (image_failed)
          $display("[FAILED] Filter output for input image %d was incorrect!", image_count+1);
        else
          $display("[PASSED] Image %d processed succesfully.", image_count+1);

        image_failed <= 1'b0;

        if (image_count == num_images-1)
            done <= 1'b1;

        image_count <= image_count + 1;
        output_offset <= 0;

        // produced expected output image for next input image
        generate_output_image();
      end
      else
        output_offset <= output_offset + 1;
    end
  end

endmodule
