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

all : medianFilter-emulator

clean :
	rm -f median.o medianFilter-emulator.o medianFilter.o medianFilter-emulator

