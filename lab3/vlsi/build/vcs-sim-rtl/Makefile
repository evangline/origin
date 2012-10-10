#=======================================================================
# UCB VLSI FLOW: Makefile for vcs-sim-rtl
#-----------------------------------------------------------------------
# Yunsup Lee (yunsup@cs.berkeley.edu)
#
# This makefile will build a rtl simulator and run various tests to
# verify proper functionality.
#

default : all
basedir  = ../..
refdir = $(basedir)/ref
include ../Makefrag

#--------------------------------------------------------------------
# Sources
#--------------------------------------------------------------------

# Verilog sources
srcdir = $(basedir)/generated-src
vsrcs = \
	$(srcdir)/convolutionFilter.${PIPE_STAGES}.v \
	$(basedir)/testbench/convolutionFilterTestHarness_rtl.v \

# C sources (for testbench)
csrcdir = $(basedir)/csrc
csrcs = \
        $(csrcdir)/main.cpp \
        $(csrcdir)/convolution.cpp \

#--------------------------------------------------------------------
# Build rules
#--------------------------------------------------------------------

verilog_cells_dir = $(UCB_VLSI_HOME)/stdcells/$(UCB_STDCELLS)/verilog

VCS      = vcs -full64
VCS_OPTS = -notice -PP -line +lint=all,noVCDE +v2k -timescale=1ns/10ps \
           +vc+list +libext+.v \
          
#--------------------------------------------------------------------
# Build the simulator
#--------------------------------------------------------------------

vcs_sim = simv
$(vcs_sim) : Makefile $(vsrcs) $(csrcs)
	$(VCS) $(VCS_OPTS) +incdir+$(srcdir) -o $(vcs_sim) \
	+define+CLOCK_PERIOD=$(vcs_clock_period) \
	+define+INPUT_DELAY=$(input_delay) \
	+define+OUTPUT_DELAY=$(output_delay) \
        -v $(refdir)/SRAM1R1W1024x32.v \
	$(vsrcs) $(csrcs)

#--------------------------------------------------------------------
# Run
#--------------------------------------------------------------------

vpd = vcdplus.vpd
$(vpd): $(vcs_sim)
	./simv +vcdpluson=1

run: $(vpd)

#--------------------------------------------------------------------
# Default make target
#--------------------------------------------------------------------

.PHONY: run

all : $(vcs_sim)

#--------------------------------------------------------------------
# Clean up
#--------------------------------------------------------------------

junk += simv* csrc *.vpd *.key DVE* .vcs* timestamp

clean :
	rm -rf $(junk) *~ \#* *.log *.cmd *.daidir vc_hdrs.h
