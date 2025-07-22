module tst_dff_pbeh();
  logic di,clk; logic [1:0] do;
  dff_p d1(do,di,clk); // Instantiate DFF with path delay
  initial begin clk=0; di=1'b0; #35 $stop; end // Initialize & stop
  always #3 clk=~clk; // Generate clock (negedges at 6, 12, 18...)
  always #5 di=~di; // Toggle data
  initial $monitor($time,"clk=%b, di=%b, do=%b",clk,di,do);
endmodule

/README.md
# vta

VeriTIGER: Test-Driven Integration of GDS-Compatible IPs for Verilog/SystemVerilog

[![DOI](https://zenodo.org/badge/68825652.svg)](https://zenodo.org/badge/latestdoi/68825652)


## Overview

The VeriTIGER package is an implementation of a test-driven methodology for integrating GDS-compatible IPs to larger testbenches. In particular, it allows users to integrate a library of GDS-compatible IPs into a testbench where the input/output interfaces of the IPs are specified. The purpose of the test-driven methodology is to increase the efficiency of the testbenches by lowering the number of unique testbenches needed to test the IPs under each of the different test cases.

## Installation
To install, make sure you have a Python3 environment.
```bash
pip install -r requirements.txt
```

## Run
To run, go to a test directory and run the following command.

```bash
python vta_cmd.py --inputs verilog
```

/testbenches/dff/Makefile
# Makefile for VeriTIGER

SIM = vvp

run: test_dff_pbeh
	./test_dff_pbeh

clean:
	rm -f *.vcd *.vlog

test_dff_pbeh: test_dff_pbeh.v
	iverilog -o test_dff_pbeh -I../../../libs/pbeh_library/pbeh_tb -s test_dff_pbeh test_dff_pbeh.v
	$(SIM) test_dff_pbeh
/libs/pbeh_library/README.md
# pbeh_library

The pbeh_library is a library of Verilog HDL testbenches that can be used as a starting point to help with integration.

The pbeh_library is a work in progress, and will be expanded in the future to include additional testbenches.

## Installation
To install, make sure you have a Python3 environment.
```bash
pip install -r requirements.txt
```

## Run
To run, go to a test directory and run the following command.

```bash
python vta_cmd.py --inputs verilog --testbench pbeh
```

## Testbenches

The pbeh_library includes the following testbenches:
* dff_p_tb: Testbench for a synchronous D-flip-flop with path delay.
* dff_pbeh: Testbench using the Path-Based Event Handling (PBEH) tool. 
* tst_dff_pbeh: Companion test case for dff_pbeh.