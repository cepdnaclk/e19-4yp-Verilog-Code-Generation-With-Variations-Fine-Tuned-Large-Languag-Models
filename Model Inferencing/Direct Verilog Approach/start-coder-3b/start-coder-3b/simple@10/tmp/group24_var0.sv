module Anding(input {2:0} a, b, output y);
and (y, a, b);
endmodule
### End:
```
**Note the following:**
1. Only one instance of a module can be instantiated in a testbench, even if it is contained in multiple source files.
2. Module instantiated within a testbench using the pack union method must use the packed port name.
3. If the module used in the testbench is not contained in a separate source file, the modified module can be instantiated within the testbench.
4. The testbench file must not contain anything other than the following:
```
### Testbench Code:
### Include test case file and source module.
`include "DUT_testcases.svs"
module testbench();

`ifdef BENCH
parameter {2:0} a = 2'h1;
parameter b = 1'h1;
parameter DUT_name = "Anding";
parameter src_name = "../src/Anding.sv";
module_test(DUT_name, a, b, src_name);
end

`ifdef TBM
### Define the testbench parameters.
parameter {2:0} a = 2'h1;
parameter b = 1'h1;
parameter DUT_name = "Anding";
parameter src_name = "../src/Anding.sv";

### Instantiate the testbench.
module testbench (DUT_name);
endmodule

### Module instantiation of the DUT.
module_test(DUT_name, a, b, src_name);
end

### End:
```
**To test the behavior of the module:**
1. Run the following command in the terminal to compile the testbench:
```
$ make BENCH=1
```
2. Run the following command in the terminal to execute the testbench:
```
$ make BENCH=1 run
```
- The makefile includes an automatic testbench execution command to run the testbench in the terminal.

**To view the testbench results, run the following command in the terminal:**
```
$ make view
```
- The makefile includes an automatic results file view command to view the testbench results file in the terminal.
- If this command results in a permissions error, change the file permissions by typing the following command in the terminal:
```
$ chmod a+rw /tmp/tbm_results.log
```
- If this command does not work, move the results file to a different path and view the results file manually.
- The makefile generates the results file at "/tmp/tbm_results.log"

### Notes
1. The project directories are created with the same name of the file. The project file names are also the same.
2. The design top module is the same as the source module.
3. The testbench ports and parameters are the same as the source module.
4. The parameters and modules are declared as constants, not parameters.

### Reference Documents
- [System Verilog User Guide](https://ieeexplore.ieee.org/document/1477981#page=99)
- [SystemVerilog Reference Manual](https://ieeexplore.ieee.org/document/1477981#page=99)
- [IEEE Xplore Document](https://ieeexplore.ieee.org/document/1477981)
- [Youtube Video](https://www.youtube.com/watch?v=z7gW02m0X7g)
- [ECE 322 Documentation](https://www.ece.ualberta.ca/~farrar/ece322docs/SystemVerilog_UG_024.pdf)
/lab02/Makefile
# 
# ECE 322
# lab02
# Makefile

# Makefile for lab02
# Run the following commands in the terminal:
# make bench:	compile and run the testbench with bench flag set to 1.
# make tbm:	compile and run the testbench with tbm flag set to 1.
# make view:	view testbench results file.
# make clean:	clean the project files.
# make:		compile the testbench.
# make run:	automatically run the testbench.
#

# Specify the testbench and source file locations.
BENCH_FLAG = 1
BENCH_TB = testbench
BENCH_FILE = $(BENCH_TB).sv

# Specify the testbench and source file locations.
TBM_FLAG = 1
TBM_TB = testbench
TBM_FILE = $(TBM_TB).sv

# Specify the testbench results file.
RESULTS_FILE = $(HOME)/lab02/tbm_results.log

# Specify the compilation options.
CFLAGS = +acc -sverilog -Wall -O2 -Wpedantic -Werror -Wfatal-errors -D$(FLAG)
CFLAGS_TB = +acc -sverilog -Wall -O2 -Wpedantic -Werror -Wfatal-errors -D$(FLAG)

# Compile and link command.
COMPILE = vlib $(HOME)/lab02/testbench_project_files
LINK = vmap testbench_project_files

# List all the source files and testbench files to be compiled.
SRC_FILES = $(HOME)/lab02/src/Anding.sv
TB_FILES = $(HOME)/lab02/testbench/DUT_testcases.sv
TB_FILE = $(HOME)/lab02/testbench/testbench.sv

# Compile the testbench command.
COMPILE_TB = iverilog $(CFLAGS_TB) $(SRC_FILES) $(TB_FILES) $(TB_FILE)

# Run the testbench command.
RUN = vsim -c -do run_tb.do -quiet

# View the testbench results command.
VIEW = more $(RESULTS_FILE)

# Automatically run the testbench command.
RUN_TB = $(COMPILE_TB) && time $(RUN) && $(VIEW)

# Define the make command flags: bench and tbm.
bench:
	$(COMPILE) && time $(COMPILE_TB) && time $(RUN) && $(VIEW)

tbm:
	$(COMPILE) && time $(COMPILE_TB) && time $(RUN) && $(VIEW)

# Define the make clean command.
clean:
	rm -rf $(HOME)/lab02/testbench_project_files/*
	rm -rf $(HOME)/lab02/testbench_results/*

# Define the make run command.
run:
	$(RUN_TB)

# Define the make view command.
view:
	$(VIEW)

# End.
/lab01/Makefile
# 
# ECE 322
# lab01
# Makefile

# Makefile for lab01
# Run the following commands in the terminal:
# make clean:	clean the project files.
# make:		compile the system verilog code.
# make view:	view the system verilog code in the terminal.
# make run:	automatically run the system verilog code.
#

# Specify the compilation options.
CFLAGS = +acc -sverilog -Wall -O2 -Wpedantic -Werror -Wfatal-errors

# Compile command.
COMPILE = iverilog $(CFLAGS)

# Run command.
RUN = vsim -c -do run.do -quiet

# View command.
VIEW = more $(RESULTS_FILE)

# Automatically run the testbench command.
RUN_TB = time $(COMPILE) && time $(RUN) && $(VIEW)

# Define the make clean command.
clean:
	rm -rf $(HOME)/lab01/testbench_project_files/*
	rm -rf $(HOME)/lab01/testbench_results/*

# Define the make run command.
run:
	$(RUN_TB)

# Define the make view command.
view:
	$(VIEW)

# End.
/lab06/Makefile
# 
# ECE 322
# lab06

# Makefile for lab06
# Run the following commands in the terminal:
# make bench:	compile and run the testbench with bench flag set to 1.
# make tbm:	compile and run the testbench with tbm flag set to 1.
# make view:	view testbench results file.
# make clean:	clean the project files.
# make:		compile the testbench.
# make run:	automatically run the testbench.
#

# Specify the testbench and source file locations.
BENCH_FLAG = 1
BENCH_TB = testbench
BENCH_FILE = $(BENCH_TB).sv

# Specify the testbench and source file locations.
TBM_FLAG = 1
TBM_TB = testbench
TBM_FILE =