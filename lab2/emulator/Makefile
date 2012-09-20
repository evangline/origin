basedir = ..
include ../Makefrag

CXX = g++
CXXFLAGS = -g -O2 -I./generated-src -I./testbench
LDFLAGS = -g

INCLUDES = generated-src/emulator.h generated-src/$(MODEL).h testbench/median.h

default : all

median-test: $(basedir)/src/median.scala
	cd $(basedir)/sbt ; $(SBT) "project work" "run median9test --backend c --compile --targetDir ../emulator/generated-src --genHarness --test"

generated-src/$(MODEL).cpp: $(basedir)/src/*.scala
	cd $(basedir)/sbt && $(SBT) "project work" "run filter --backend c --targetDir ../emulator/generated-src"

generated-src-debug/$(MODEL).cpp: $(basedir)/src/*.scala
	cd $(basedir)/sbt && $(SBT) "project work" "run filter --backend c --debug --vcd --targetDir ../emulator/generated-src-debug"

$(MODEL).o: generated-src/$(MODEL).cpp $(INCLUDES)
	$(CXX) $(CXXFLAGS) -c $<

median.o: testbench/median.cpp testbench/median.h
	$(CXX) $(CXXFLAGS) -c $<

$(MODEL)-emulator.o: testbench/$(MODEL)-emulator.cpp generated-src/$(MODEL).cpp
	$(CXX) $(CXXFLAGS) -c $<

$(MODEL)-emulator: $(MODEL)-emulator.o $(MODEL).o median.o
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
	rm -rf median.o $(MODEL)-emulator.o $(MODEL).o $(MODEL)-emulator *.vcd *.vpd DVEfiles

