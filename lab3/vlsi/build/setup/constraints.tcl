# create clock
create_clock clk -name clk -period ${CLOCK_PERIOD}
set_clock_uncertainty ${CLOCK_UNCERTAINTY} [get_clocks clk]

# set drive strength for inputs
set_driving_cell -lib_cell INVX1_RVT [all_inputs]

# Set timing contraints for the input and output I/O ports
set dim_inputs [get_ports io_image_*]
set all_inputs_but_clk [remove_from_collection [all_inputs] [get_ports clk]]
set all_inputs_but_dim [remove_from_collection $all_inputs_but_clk $dim_inputs]
set_input_delay ${INPUT_DELAY} -clock [get_clocks clk] $all_inputs_but_dim
set_output_delay ${OUTPUT_DELAY} -clock [get_clocks clk] [all_outputs]

set_false_path -from $dim_inputs
set_false_path -from [get_ports reset]

# set capacitance of input ports, load of output ports
set max_cap [expr [load_of "${RVT_lib}/AND2X1_RVT/A1"] * 5]
set_max_capacitance $max_cap $all_inputs_but_clk
set_load [expr 3 * $max_cap] [all_outputs]

# preserve (parts of) hierarchy
set_ungroup windowBuf5x5 false
set_ungroup convolver false
set_ungroup convolver/conv true

# another option to specify max number of cells to use from certain VT libraries
# alternative to set_leakage_optimization true
#set_multi_vth_constraint -lvth_groups {LVT} -lvth_percentage 5.0 -type soft

