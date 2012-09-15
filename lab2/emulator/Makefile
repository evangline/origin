LDFLAGS = -g
CPPFLAGS = -g -O2 -I./generated-src -I./testbench
CPP = g++
INCLUDES = generated-src/emulator.h generated-src/medianFilter.h testbench/median.h

default : all

medianFilter.o: generated-src/medianFilter.cpp $(INCLUDES)
	$(CPP) $(CPPFLAGS) -c $<

median.o: testbench/median.cpp testbench/median.h
	$(CPP) $(CPPFLAGS) -c $<

medianFilter-emulator.o: testbench/medianFilter-emulator.cpp $(INCLUDES)
	$(CPP) $(CPPFLAGS) -c $<

medianFilter-emulator: medianFilter-emulator.o medianFilter.o median.o
	$(CPP) $(LDFLAGS) -o $@ $+

run : medianFilter-emulator
	./medianFilter-emulator

# sed line is a hack in case trace file generation is interrupted (e.g. by a segfault)
# just remove the last line
#	sed -i '$$d' trace.vcd

run-debug : medianFilter-emulator
	./medianFilter-emulator -t

run-trace : medianFilter-emulator
	-./medianFilter-emulator -v
	vcd2vpd -q trace.vcd trace.vpd
	rm -f trace.vcd

all : medianFilter-emulator

clean :
	rm -f median.o medianFilter-emulator.o medianFilter.o medianFilter-emulator *.vcd *.vpd

