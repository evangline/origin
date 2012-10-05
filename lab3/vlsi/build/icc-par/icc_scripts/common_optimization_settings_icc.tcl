##########################################################################################
# Version: D-2010.03-SP2 (July 6, 2010)
# Copyright (C) 2007-2010 Synopsys, Inc. All rights reserved.
##########################################################################################


echo "\tLoading :\t\t [info script]"
## Optimization Common Session Options - set in all sessions

set_host_options -max_cores $ICC_NUM_CORES

## General Optimization
set_app_var timing_enable_multiple_clocks_per_reg true 
set_fix_multiple_port_nets -all -buffer_constants  

##Evaluate whether you library and design requires timing_use_enhanced_capacitance_modeling or not. Also only needed for OCV
#set_app_var timing_use_enhanced_capacitance_modeling true ;#PT default -  libraries with capacitance ranges (also see Solvnet 021686)


   if {$ICC_MAX_AREA != ""} {
     set_max_area $ICC_MAX_AREA
   }


## Set Area Critical Range
## Typical value: 10 percent of critical clock period
if {$AREA_CRITICAL_RANGE_PRE_CTS != ""} {set_app_var physopt_area_critical_range $AREA_CRITICAL_RANGE_PRE_CTS}


## Set Power Critical Range
## Typical value: 9 percent of critical clock period
if {$POWER_CRITICAL_RANGE_PRE_CTS != ""} {set_app_var physopt_power_critical_range $POWER_CRITICAL_RANGE_PRE_CTS}


## Set dont use cells
## Examples, big drivers (EM issues), very weak drivers, delay cells,
## clock cells

if {[file exists [which $ICC_IN_DONT_USE_FILE]] } {
        source  $ICC_IN_DONT_USE_FILE
}


## Fixing the locations of the hard macros
if {[all_macro_cells] != "" } {
  set_dont_touch_placement [all_macro_cells]
}

## Script for customized set_multi_vth_constraints constraints. Effective only when $POWER_OPTIMIZATION is set to TRUE.
#  Specify to make leakage power optimization focused on lvt cell reduction. Refer to rm_icc_scripts/multi_vth_constraint.example as an example.
if {[file exists [which $ICC_CUSTOM_MULTI_VTH_CONSTRAINT_SCRIPT]] } { 
        source -echo  $ICC_CUSTOM_MULTI_VTH_CONSTRAINT_SCRIPT 
}

### To reset power options to default to override what is stored in Milkyway database
##  set_power_options -default
#
#if {$ICC_CTS_CLOCK_GATE_MERGE} {
# set_power_options -clock_gating true
#} else {
# set_power_options -clock_gating false
#}
#
#if {$ICC_LOW_POWER_PLACEMENT} {
#  set_power_options -low_power_placement true
#} else {
#  set_power_options -low_power_placement false
#}
#
#if {$LEAKAGE_POWER} {
### Turn on leakage
#  set_power_options -leakage true
#} else {
### Turn off leakage
#  set_power_options -leakage false
#}
#
#if {$DYNAMIC_POWER} {
### Dynamic power opto throughout the flow
#  set_power_options -dynamic true
#} else {
### No dynamic power opto
#  set_power_options -dynamic false
#}

## End of Common Optimization Session Options

