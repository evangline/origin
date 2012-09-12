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
	cd sbt; sbt "project work" "run filter --backend c --targetDir ../emulator/generated-src"
	date > $(emulator_timestamp)

emulator: $(emulator_timestamp)

run-emulator: emulator
	cd emulator; make run

median-test: sbt/src/main/scala/median.scala
	cd sbt; sbt "project work" "run median9test --backend c --compile --targetDir ../emulator/generated-src --genHarness --test"

clean:
	rm -rf emulator/generated-src/* sbt/target sbt/work sbt/project/target

.PHONY: emulator
