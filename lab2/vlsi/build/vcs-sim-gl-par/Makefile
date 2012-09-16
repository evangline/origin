#=======================================================================
# UCB VLSI Makefile for vcs-sim-gl-par
#-----------------------------------------------------------------------

include ../Makefrag

default : all

basedir  = ../..

#--------------------------------------------------------------------
# Sources
#--------------------------------------------------------------------

toplevel = medianFilter

# Verilog sources

srcdir = $(basedir)/testbench
vsrcs = \
	$(srcdir)/medianFilterTestHarness_rtl.v \
	../icc-par/current-icc/results/$(toplevel).output.v \

# C sources (for testbench)
csrcdir = $(basedir)/csrc
csrcs = \
        $(csrcdir)/main.cpp \
        $(csrcdir)/median.cpp \

#--------------------------------------------------------------------
# Build rules
#--------------------------------------------------------------------

verilog_cells_dir = $(UCB_VLSI_HOME)/stdcells/$(UCB_STDCELLS)/verilog

VCS      = vcs -full64
VCS_OPTS = -notice -PP +lint=all,noVCDE,noTFIPC,noIWU,noOUDPE \
           +vc+list +v2k -timescale=1ns/1ps +neg_tchk +sdfverbose -negdelay \
           -sdf typ:$(toplevel):../icc-par/current-icc/results/$(toplevel).output.corrected.sdf \

#	-P ../icc-par/current-icc/access.tab -debug \

#--------------------------------------------------------------------
# Build the simulator
#--------------------------------------------------------------------

vcs_sim = simv
$(vcs_sim) : Makefile $(vsrcs) $(csrcs)
	$(VCS) $(VCS_OPTS) +incdir+$(srcdir) -o $(vcs_sim) \
	+define+CLOCK_PERIOD=$(vcs_clock_period) \
	-v $(verilog_cells_dir)/cells_lvt.v \
	-v $(verilog_cells_dir)/cells_rvt.v \
	-v $(verilog_cells_dir)/cells_hvt.v \
	-v $(verilog_cells_dir)/sram.v \
	$(vsrcs) $(csrcs)

#--------------------------------------------------------------------
# Run
#--------------------------------------------------------------------

vpd = vcdplus.vpd
$(vpd): $(vcs_sim)
	./simv +vcdpluson=1

run: $(vpd)

#--------------------------------------------------------------------
# Convert
#--------------------------------------------------------------------

convert_saif = vcdplus.saif

$(convert_saif): %.saif: %.vpd
	vcd2saif -input $(patsubst %.saif, %.vcd, $@)  -output $@ -pipe "vpd2vcd $(patsubst %.saif,%.vpd,$@) $(patsubst %.saif,%.vcd,$@)"
	date > timestamp

convert: $(convert_saif)

#--------------------------------------------------------------------
# Default make target
#--------------------------------------------------------------------

.PHONY: run convert

all : $(vcs_sim)

#--------------------------------------------------------------------
# Clean up
#--------------------------------------------------------------------

junk += simv* csrc *.vpd *.vcd *.saif *.key DVE* .vcs* sdf* timestamp vc_hdrs.h

clean :
	rm -rf $(junk) *~ \#* *.log *.cmd *.daidir
