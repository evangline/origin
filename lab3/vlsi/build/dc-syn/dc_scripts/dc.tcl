source dc_setup.tcl

#################################################################################
# Setup for Formality verification
#################################################################################

set_svf ${RESULTS_DIR}/${DCRM_SVF_OUTPUT_FILE}

#################################################################################
# Read in the RTL Design
#################################################################################

define_design_lib WORK -path ./WORK
analyze -format verilog ${RTL_SOURCE_FILES}
elaborate ${DESIGN_NAME}
analyze_datapath_extraction > ${REPORTS_DIR}/${DESIGN_NAME}.datapath.rpt
write -hierarchy -format ddc -output ${RESULTS_DIR}/${DCRM_ELABORATED_DESIGN_DDC_OUTPUT_FILE}

link

#################################################################################
# Apply Logical Design Constraints
#################################################################################

source -echo ${DCRM_CONSTRAINTS_INPUT_FILE}

#################################################################################
# Apply The Operating Conditions
#################################################################################

# Set operating condition on top level
#set_operating_conditions \
  -analysis_type bc_wc \
  -max ss0p95v125c -max_library saed32rvt_ss0p95v125c \
  -min ff1p16vn40c -min_library saed32rvt_ff1p16vn40c

#################################################################################
# Create Default Path Groups
#
# Separating these paths can help improve optimization.
# Remove these path group settings if user path groups have already been defined.
#################################################################################

set ports_clock_root [filter_collection [get_attribute [get_clocks] sources] object_class==port]
group_path -name REGOUT -to [all_outputs]
group_path -name REGIN -from [remove_from_collection [all_inputs] $ports_clock_root]
group_path -name FEEDTHROUGH -from [remove_from_collection [all_inputs] $ports_clock_root] -to [all_outputs]

# multi-vt flow
set_leakage_optimization true

##################################################################################
# Specify ignored layers for routing to improve correlation
# Use the same ignored layers that will be used during place and route
##################################################################################
if { ${MIN_ROUTING_LAYER} != ""} {
  set_ignored_layers -min_routing_layer ${MIN_ROUTING_LAYER}
}
if { ${MAX_ROUTING_LAYER} != ""} {
  set_ignored_layers -max_routing_layer ${MAX_ROUTING_LAYER}
}
#report_ignored_layers

#################################################################################
# Apply Additional Optimization Constraints
#################################################################################
# Prevent assignment statements in the Verilog netlist.
set_fix_multiple_port_nets -all -buffer_constants

#################################################################################
# Compile the Design
#################################################################################

check_design

if { ${PIPE_STAGES} == 1} {
  set_dont_retime convolver/dout_reg*
  compile_ultra -gate_clock -timing_high_effort_script
} else {
  # recommended in DC-RRT manual for pipelined designs
  set hdlin_ff_always_sync_set_reset true

# MULTICYCLE PATH METHOD
#  set_multicycle_path ${PIPE_STAGES} -to convolver/result_reg*
#  set_dont_retime convolver true

# MAX DELAY METHOD
# calculate target clock period, pre retiming

  set max_del [expr "(${CLOCK_PERIOD} * ${PIPE_STAGES}) - (${PIPE_OVERHEAD}*${PIPE_STAGES})"]
  echo "pre-retiming synthesis target clock period for convolver : $max_del"
  set_max_delay $max_del -to convolver/result_reg*
  set_dont_retime convolver/dout_reg*
  set_dont_retime convolver/result_reg*

# do initial compilation
  compile_ultra -no_autoungroup -timing_high_effort_script

  # undo retiming related constraints
  reset_path -to convolver/result_reg*
  set_dont_retime convolver/result_reg* false
  set_dont_retime convolver/dout_reg*

  # perform register retiming
  set_optimize_registers true -design convolution_wrapper -check_design \
    -sync_transform multiclass -async_transform multiclass
  optimize_registers -only_attributed_designs -check_design -print_critical_loop

  # incremental compile
  compile_ultra -incr -gate_clock -timing_high_effort_script
} 

#################################################################################
# Write Out Final Design and Reports
#
#        .ddc:   Recommended binary format used for subsequent Design Compiler sessions
#        .v  :   Verilog netlist for ASCII flow (Formality, PrimeTime, VCS)
#        .sdf:   SDF backannotated topographical mode timing for PrimeTime
#        .sdc:   SDC constraints for ASCII flow
#
#################################################################################

change_names -rules verilog -hierarchy
set_svf -off
write -format ddc -hierarchy -output ${RESULTS_DIR}/${DCRM_FINAL_DDC_OUTPUT_FILE}
write -f verilog -hierarchy -output ${RESULTS_DIR}/${DCRM_FINAL_VERILOG_OUTPUT_FILE}
write_sdc -nosplit ${RESULTS_DIR}/${DCRM_FINAL_SDC_OUTPUT_FILE}

source find_regs.tcl
find_regs ${STRIP_PATH}

#################################################################################
# Generate Final Reports
#################################################################################

report_qor > ${REPORTS_DIR}/${DCRM_FINAL_QOR_REPORT}
report_timing -input_pins -capacitance -transition_time -nets -significant_digits 4 -nosplit -nworst 10 -max_paths 10 > ${REPORTS_DIR}/${DESIGN_NAME}.mapped.timing.rpt
report_area -hierarchy -physical -nosplit > ${REPORTS_DIR}/${DCRM_FINAL_AREA_REPORT}
report_area -hierarchy -nosplit > ${REPORTS_DIR}/${DCRM_FINAL_AREA_REPORT}
report_power -nosplit -hier > ${REPORTS_DIR}/${DCRM_FINAL_POWER_REPORT}
report_clock_gating -nosplit > ${REPORTS_DIR}/${DCRM_FINAL_CLOCK_GATING_REPORT}
report_reference -nosplit -hierarchy > ${REPORTS_DIR}/${DESIGN_NAME}.mapped.reference.rpt
report_resources -nosplit -hierarchy > ${REPORTS_DIR}/${DESIGN_NAME}.mapped.resources.rpt

exit
