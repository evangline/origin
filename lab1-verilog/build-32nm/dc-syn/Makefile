#=======================================================================
# UCB VLSI FLOW: Makefile for dc-syn & fm-ver
#-----------------------------------------------------------------------
# Yunsup Lee (yunsup@cs.berkeley.edu)
#
# This makefile will use Synopsys Design Compiler to synthesize
# your RTL into a gate-level verilog netlist.
# This makefile will use Synopsys Formality to verify
# generated gate-level verilog netlist against your RTL implementation.
#

include ../Makefrag

default: all

basedir  = ../..

#--------------------------------------------------------------------
# Sources
#--------------------------------------------------------------------

# Library components

vclibdir = $(UCB_VLSI_HOME)/install/vclib
vclibsrcs = \

# Verilog sources (do not include test harness!)

srcdir = $(basedir)/src
vsrcs = \
	$(srcdir)/gcdGCDUnitCtrl.v \
	$(srcdir)/gcdGCDUnitDpath.v \
	$(srcdir)/gcdGCDUnit_rtl.v \

# Specify what the toplevel verilog module is

toplevel = gcdGCDUnit_rtl
testharness = gcdTestHarness_rtl
toplevelinst = gcd

#--------------------------------------------------------------------
# Build rules
#--------------------------------------------------------------------

dc_exec         := dc_shell-xg-t -64bit -topographical_mode
fm_exec         := fm_shell -64bit
build_suffix    := $(shell date +%Y-%m-%d_%H-%M)
build_dc_dir    := build-dc-$(build_suffix)
cur_build_dc_dir:= current-dc
reports_dir     := reports
results_dir     := results
log_dir         := log
stdcells_dir    := $(UCB_VLSI_HOME)/stdcells/$(UCB_STDCELLS)
db_cells_dir    := $(stdcells_dir)/db
mw_cells_dir    := $(stdcells_dir)/mw
techfile_dir    := $(stdcells_dir)/techfile
tluplus_dir     := $(stdcells_dir)/tluplus

dc_timestamp    := $(cur_build_dc_dir)/timestamp
dc_ddc          := $(cur_build_dc_dir)/$(results_dir)/$(toplevel).mapped.ddc
fm_rpt          := $(cur_build_dc_dir)/$(reports_dir)/$(toplevel).fmv_verify.rpt

vars_tcl        := rm_setup/common_setup.tcl rm_setup/dc_setup.tcl rm_setup/dc_setup_filenames.tcl
makegen_tcl     := make_generated_vars.tcl

dc_tcl          := rm_dc_scripts/dc.tcl
dc_misc_tcl     := rm_dc_scripts/find_regs.tcl
fm_tcl          := rm_dc_scripts/fm.tcl
constraints_tcl := constraints.tcl

vars = \
	set DESIGN_NAME                 "$(toplevel)";\n \
	set STRIP_PATH                  "$(testharness)/$(toplevelinst)";\n \
	set ADDITIONAL_SEARCH_PATH      "$(db_cells_dir) $(UCB_VLSI_HOME)/install/vclib ../$(srcdir)";\n \
	set TARGET_LIBRARY_FILES        "cells.db";\n \
	set MW_REFERENCE_LIB_DIRS       "$(mw_cells_dir)/cells.mw";\n \
	set TECH_FILE                   "$(techfile_dir)/techfile.tf";\n \
	set MAP_FILE                    "$(techfile_dir)/tech2itf.map";\n \
	set TLUPLUS_MAX_FILE            "$(tluplus_dir)/max.tluplus";\n \
	set TLUPLUS_MIN_FILE            "$(tluplus_dir)/min.tluplus";\n \
	set ALIB_DIR                    "$(UCB_VLSI_HOME)/stdcells/$(UCB_STDCELLS)/alib";\n \
	set RTL_SOURCE_FILES            "$(notdir $(vclibsrcs) $(vsrcs))";\n \
	set DCRM_CONSTRAINTS_INPUT_FILE "constraints.tcl";\n \
	set REPORTS_DIR                 "$(reports_dir)";\n \
	set RESULTS_DIR                 "$(results_dir)";\n \
	set CLOCK_PERIOD                "$(dc_clock_period)";\n \

define new-build-dir-cmds
	mkdir $(build_dc_dir)
	rm -f $(cur_build_dc_dir)
	ln -s $(build_dc_dir) $(cur_build_dc_dir)
	cp $(dc_tcl) $(dc_misc_tcl) $(constraints_tcl) $(vars_tcl) $(cur_build_dc_dir)
	echo -e '$(vars)' > $(cur_build_dc_dir)/$(makegen_tcl)
	date > $(dc_timestamp)
endef

new-build-dir:
	$(new-build-dir-cmds)

$(dc_timestamp): Makefile $(vsrcs) $(vclibsrcs) $(vars_tcl) $(constraints_tcl) $(dc_tcl) $(dc_misc_tcl)
	$(new-build-dir-cmds)

$(dc_ddc): $(dc_timestamp)
	cd $(cur_build_dc_dir); \
	mkdir -p $(log_dir); \
	$(dc_exec) -f $(notdir $(dc_tcl)) | tee $(log_dir)/dc.log; \
	sdfcorrect.py results/$(toplevel).mapped.sdf results/$(toplevel).mapped.corrected.sdf \
	cd ..

dc: $(dc_ddc)

$(fm_rpt): $(dc_ddc) $(fm_tcl)
	cp $(fm_tcl) $(constraints_tcl) $(vars_tcl) $(cur_build_dc_dir)
	echo -e '$(vars)' > $(cur_build_dc_dir)/$(makegen_tcl)
	cd $(cur_build_dc_dir); \
	mkdir -p $(log_dir); \
	$(fm_exec) -f $(notdir $(fm_tcl)) | tee $(log_dir)/fm.log; \
	cd ..

fm: $(fm_rpt)

#--------------------------------------------------------------------
# Default make target
#--------------------------------------------------------------------

.PHONY: dc fm

all: dc

#--------------------------------------------------------------------
# Clean up
#--------------------------------------------------------------------

junk +=

clean:
	rm -rf build* current* $(junk) *~ \#*
