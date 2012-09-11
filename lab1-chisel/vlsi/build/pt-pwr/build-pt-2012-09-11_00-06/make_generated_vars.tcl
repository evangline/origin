set DESIGN_NAME                 "GCD";
 set ADDITIONAL_SEARCH_PATH      "/home/ff/cs250/stdcells/synopsys-90nm/default/db ../../icc-par/current-icc/results";
 set TARGET_LIBRARY_FILES        "cells.db cells_cg.db";
 set REPORTS_DIR                 "reports";
 set NETLIST_FILES               "GCD.output.v";
 set CONSTRAINTS_FILES           "../../icc-par/current-icc/results/GCD.output.sdc";
 
set STRIP_PATH                  "gcdTestHarness_rtl/gcd";
 set PT_METHOD                   "time";
 
set PARASITIC_PATHS             "GCD";
 set PARASITIC_FILES             "../../icc-par/current-icc/results/GCD.output.sbpf.max";
 set PT_PARASITIC                "max";
 
set ACTIVITY_FILE "../../vcs-sim-gl-par/vcdplus.vcd";

set PT_EXEC "vcdplus";

