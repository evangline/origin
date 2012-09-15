#=======================================================================
# UCB Chisel Flow: Makefile 
#-----------------------------------------------------------------------

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
	cd sbt; sbt "project work" "run filter --vcd --backend c --targetDir ../emulator/generated-src"
	date > $(emulator_timestamp)

emulator: $(emulator_timestamp)

run-emulator: emulator
	cd emulator; make run

# Rerun if scala files or Makefile is newer than last time make vlsi has run
$(vlsi_timestamp): $(src_files)
	cd sbt; sbt "project work" "run filter --backend v --targetDir ../vlsi/generated-src"
	date > $(vlsi_timestamp)

vlsi: $(vlsi_timestamp)

median-test: sbt/src/main/scala/median.scala
	cd sbt; sbt "project work" "run median9test --backend c --compile --targetDir ../emulator/generated-src --genHarness --test"

clean:
	rm -rf vlsi/generated-src/* emulator/generated-src/* sbt/target sbt/work sbt/project/target
	cd emulator ; make clean ; cd ..

.PHONY: vlsi emulator
