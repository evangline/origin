basedir = ..
include ../Makefrag

CXX = g++
CXXFLAGS = -g -O2 -I./generated-src -I./testbench
LDFLAGS = -g

INCLUDES = generated-src/emulator.h generated-src/$(MODEL).h testbench/convolution.h

default : all

convolution-test: $(basedir)/src/convolution.scala
	cd $(basedir)/sbt ; $(SBT) "project work" "run convolution5x5test --backend c --compile --targetDir ../emulator/generated-src --genHarness --test"

window-test: $(basedir)/src/window.scala
	cd $(basedir)/sbt ; $(SBT) "project work" "run windowBuf5x5test --backend c --compile --targetDir ../emulator/generated-src --genHarness --test"

generated-src/$(MODEL).cpp: $(basedir)/src/*.scala
	cd $(basedir)/sbt && $(SBT) "project work" "run filter ${PIPE_STAGES} --backend c --targetDir ../emulator/generated-src --debug --vcd --Wall"

$(MODEL).o: generated-src/$(MODEL).cpp $(INCLUDES)
	$(CXX) $(CXXFLAGS) -c $<

convolution.o: testbench/convolution.cpp testbench/convolution.h
	$(CXX) $(CXXFLAGS) -c $<

$(MODEL)-emulator.o: testbench/$(MODEL)-emulator.cpp generated-src/$(MODEL).cpp
	$(CXX) $(CXXFLAGS) -c $<

$(MODEL)-emulator: $(MODEL)-emulator.o $(MODEL).o convolution.o
	$(CXX) $(LDFLAGS) -o $@ $+

run : $(MODEL)-emulator
	./$(MODEL)-emulator

# sed line is a hack in case trace file generation is interrupted (e.g. by a segfault)
# just remove the last line
#	sed -i '$$d' trace.vcd

run-debug : $(MODEL)-emulator
	./$(MODEL)-emulator -t

run-trace : $(MODEL)-emulator
	-./$(MODEL)-emulator -v
	vcd2vpd -q trace.vcd trace.vpd
	rm -f trace.vcd

all : $(MODEL)-emulator

clean :
	rm -rf convolution.o $(MODEL)-emulator.o $(MODEL).o $(MODEL)-emulator *.vcd *.vpd DVEfiles generated-src/*

