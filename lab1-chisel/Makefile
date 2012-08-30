#=======================================================================
# UCB Chisel Flow: Makefile 
#-----------------------------------------------------------------------
# Brian Zimmer (bmzimmer@eecs.berkeley.edu)
#
# This makefile will generate verilog files or an emulator from chisel code


src_files := Makefile sbt/src/main/scala/*.scala
vlsi_timestamp    := vlsi/generated-src/timestamp    
emulator_timestamp    := emulator/generated-src/timestamp    

compile:
	cd sbt; sbt "project work" compile

shell:
	cd sbt; sbt "project work" shell

debug:
	cd sbt; sbt "project work" last run

console:
	cd sbt; sbt "project work" console

$(emulator_timestamp): $(src_files)
	cd sbt; sbt "project work" "run --backend c --targetDir ../emulator/generated-src"
	date > $(emulator_timestamp)

emulator: $(emulator_timestamp)

run-emulator: emulator
	cd emulator; make run

# Rerun if scala files or Makefile is newer than last time make vlsi has run
$(vlsi_timestamp): $(src_files)
	cd sbt; sbt "project work" "run --backend v --targetDir ../vlsi/generated-src"
	date > $(vlsi_timestamp)

vlsi: $(vlsi_timestamp)

clean:
	rm -rf vlsi/generated-src/* emulator/generated-src/* sbt/target sbt/work sbt/project/target

#	rm -rf vlsi/generated-src/* emulator/generated-src/* sbt/target sbt/chisel sbt/work/target sbt/project/target

.PHONY: vlsi emulator
