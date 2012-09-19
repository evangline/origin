# create clock
create_clock clk -name ideal_clock1 -period ${CLOCK_PERIOD}
set_clock_uncertainty ${CLOCK_UNCERTAINTY} [get_clocks ideal_clock1]

# Set timing contraints for the input and output I/O ports
set all_inputs_but_clk [remove_from_collection [all_inputs] [get_ports clk]]
set_input_delay ${INPUT_DELAY} -clock [get_clocks ideal_clock1] $all_inputs_but_clk
set_output_delay ${OUTPUT_DELAY} -clock [get_clocks ideal_clock1] [all_outputs]

# set capacitance of input ports, load of output ports
set max_cap [expr [load_of saed32rvt_tt1p05v25c/AND2X1_RVT/A1] * 5]
set_max_capacitance $max_cap $all_inputs_but_clk
set_load [expr 3 * $max_cap] [all_outputs]

# preserve (parts of) hierarchy
set_ungroup windowBuf false
set_ungroup median9 false
