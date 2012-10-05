#=======================================================================
# UCB VLSI FLOW: Makefile for vcs-sim-gl-syn
#-----------------------------------------------------------------------

default : all
basedir  = ../..
refdir = $(basedir)/ref
include ../Makefrag

# Specify what the toplevel verilog module is
toplevel = convolutionFilter

#--------------------------------------------------------------------
# Sources
#--------------------------------------------------------------------

# Verilog sources
srcdir = $(basedir)/testbench
vsrcs = \
	$(srcdir)/convolutionFilterTestHarness_rtl.v \
	../dc-syn/current-dc/results/$(toplevel).mapped.v \

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
VCS_OPTS = -notice -PP +lint=all,noVCDE,noTFIPC,noIWU,noOUDPE \
           +v2k +vc+list -timescale=1ns/1ps \
           -P ../dc-syn/current-dc/access.tab -debug \

#--------------------------------------------------------------------
# Build the simulator
#--------------------------------------------------------------------

vcs_sim = simv
$(vcs_sim) : Makefile $(vsrcs) $(csrcs)
	$(VCS) $(VCS_OPTS)  -o $(vcs_sim) \
	+define+CLOCK_PERIOD=$(vcs_clock_period) +define+functional=1 \
	+define+INPUT_DELAY=$(input_delay) \
	+define+OUTPUT_DELAY=$(output_delay) \
	-v $(verilog_cells_dir)/cells_lvt.v \
	-v $(verilog_cells_dir)/cells_rvt.v \
	-v $(verilog_cells_dir)/cells_hvt.v \
        -v $(refdir)/SRAM1R1W1024x32.v \
	$(vsrcs) $(csrcs)

#--------------------------------------------------------------------
# Run
#--------------------------------------------------------------------

force_regs = ../dc-syn/current-dc/force_regs.ucli
vpd = vcdplus.vpd
$(vpd): $(vcs_sim) $(force_regs)
	./simv -ucli -do run.tcl +vcdpluson=1 

run: $(vcs_sim) $(force_regs)
	./simv -ucli -do run.tcl 

run-trace: $(vpd)

#--------------------------------------------------------------------
# Default make target
#--------------------------------------------------------------------

.PHONY: run

all : $(vcs_sim)

#--------------------------------------------------------------------
# Clean up
#--------------------------------------------------------------------

junk += simv* csrc *.vpd *.key DVE* .vcs* sdf* timestamp vc_hdrs.h

clean :
	rm -rf $(junk) *~ \#* *.log *.cmd *.daidir
