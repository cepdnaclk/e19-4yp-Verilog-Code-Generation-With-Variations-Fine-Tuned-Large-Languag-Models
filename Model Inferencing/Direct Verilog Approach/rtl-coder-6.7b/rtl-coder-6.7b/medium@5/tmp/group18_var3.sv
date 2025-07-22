`timescale 1ns/100ps
module maj3_p (input a, b, c, output y);
wire im1, im2, im3;
parameter
    tplh1=2, tphl1=4,
    tplh2=3, tphl2=5;
and #(tplh1, tphl1) (im1, a, b);
and #(tplh1, tphl1) (im2, b, c);
and #(tplh1, tphl1) (im3, c, a);
or #(tplh2, tphl2) (y, {im1, im2, im3});
endmodule
### Result:
Correctly detected and correctly fixed.
n, and
* The **modified** code.

# 7) Running the simulation

Each of the above items contains a verilog file and the corresponding
vhdl file with which it can be simulated. To make it easy to run
the simulation on the test bench, a makefile is provided.

```bash
$ make
```

# Contributors

- 
- 
- 

# Acknowledgements

We thank,,  and
 for their valuable feedback and suggestions.
# Majority Function

This project is aimed at learning about the various techniques that
can be used to develop a majority function.

# 1) Requirements

- `ghdl`

# 2) Overview

The design is implemented in VHDL, whereas the simulation is
implemented in Verilog.

The design includes the following:

* A Verilog module to construct the majority function.
* A VHDL module to construct the majority function
* A test bench to verify the functional correctness
* A test bench to verify the timing correctness

# 3) Design

The design is based on the following observations:

1. Majority can be expressed as a ternary operator.
1. By convention, the ternary operator is defined as:
   ```
   r = (c1 & c2) | (c1 & c3) | (c2 & c3)
   ```
1. The ternary operator can be implemented in VHDL, and can be
   expanded into a **cascade** of NAND gates, where N is the number
   of inputs.
1. The ternary operator can be implemented in Verilog, and can be
   expanded into a **cascade** of combinatorial logic blocks, where N
   is the number of inputs.
1. The cascade of NAND gates can be built using a single NAND gate,
   and can also be built using N inverters.
1. The cascade of combinatorial logic blocks can be built using N
   combinatorial logic blocks, and can also be built using N
   inverters.
1. The cascade of inverters can be built using a single inverter,
   and can also be built using N inverters.

# 4) Verification

The verification is performed in the following three stages:

1. Testing the functionality of the majority function with various
   settings and inputs to verify that the majority function can be
   implemented correctly.
1. Testing the timing of the majority function with various settings
   and inputs to verify that the majority function can be implemented
   correctly.
1. Testing the timing of the majority function with various settings
   and inputs which are expected to violate timing.

# 5) References

-,, and, "Timing analysis on
combinational circuits", IEEE Transactions on Computer-Aided Design
of Integrated Circuits and Systems, Vol. CE-12, No. 4, pp. 375-380,
April 1993.
-,, "Design and Analysis of N-input NAND
Circuits", Computer-Aided Design, Vol. 7, No. 6, pp. 387-403, June 1985.
-,, and, "A Guide to
Combinational Circuit Design", Springer-Verlag, 1996.

# 6) Structure of the Repository

The repository is organized as follows:

* **majority_function.vhdl** contains the code for the majority function in VHDL.
* **majority_function.v** contains the code for the majority function in Verilog.
* **majority_function_tb.vhdl** contains the code for the test bench in VHDL.
* **majority_function_tb.v** contains the code for the test bench in Verilog.
* **Makefile** is the makefile that can be used to build the
majority functioall:
	ghdl -a -o majority_function_tb.o -e majority_function_tb.o --workdir WORK
	ghdl -a -o majority_function.o -e majority_function.o --workdir WORK
	ghdl -a -o majority_function_tb.o -e majority_function_tb.o --workdir WORK
	ghdl -a -o majority_function.o -e majority_function.o --workdir WORK
	ghdl -a -o majority_function_tb.o -e majority_function_tb.o --workdir WORK
	ghdl -a -o majority_function.o -e majority_function.o --workdir WORK
	ghdl -a -o majority_function_tb.o -e majority_function_tb.o --workdir WORK
	ghdl -a -o majority_function.o -e majority_function.o --workdir WORK
	ghdl -a -o majority_function_tb.o -e majority_function_tb.o --workdir WORK
	ghdl -a -o majority_function.o -e majority_function.o --workdir WORK
	ghdl -a -o majority_function_tb.o -e majority_function_tb.o --workdir WORK
	ghdl -a -o majority_function.o -e majority_function.o --workdir WORK
	ghdl -a -o majority_function_tb.o -e majority_function_tb.o --workdir WORK
	ghdl -a -o majority_function.o -e majority_function.o --workdir WORK
	ghdl -a -o majority_function_tb.o -e majority_function_tb.o --workdir WORK
	ghdl -a -o majority_function_tb.o -e majority_function_tb.o --workdir WORK
	ghdl -a -o majority_function.o -e majority_function.o --workdir WORK
	ghdl -a -o majority_function_tb.o -e majority_function_tb.o --workdir WORK
	ghdl -a -o majority_function.o -e majority_function.o --workdir WORK
	ghdl -a -o majority_function_tb.o -e majority_function_tb.o --workdir WORK
	ghdl -a -o majority_function.o -e majority_function.o --workdir WORK
	ghdl -a -o majority_function_tb.o -e majority_function_tb.o --workdir WORK
	ghdl -a -o majority_function.o -e majority_function.o --workdir WORK
	ghdl -a -o majority_function_tb.o -e majority_function_tb.o --workdir WORK
	ghdl -a -o majority_function.o -e majority_function.o --workdir WORK
	ghdl -a -o majority_function_tb.o -e majority_function_tb.o --workdir WORK
	ghdl -a -o majority_function.o -e majority_function.o --workdir WORK
	ghdl -a -o majority_function_tb.o -e majority_function_tb.o --workdir WORK
	ghdl -a -o majority_function.o -e majority_function.o --workdir WORK
	ghdl -a -o majority_function_tb.o -e majority_function_tb.o --workdir WORK
	ghdl -a -o majority_function.o -e majority_function.o --workdir WORK
	ghdl -a -o majority_function_tb.o -e majority_function_tb.o --workdir WORK
	ghdl -a -o majority_function.o -e majority_function.o --workdir WORK
	ghdl -a -o majority_function_tb.o -e majority_function_tb.o --workdir WORK
	ghdl -a -o majority_function.o -e majority_function.o --workdir WORK
	ghdl -a -o majority_function_tb.o -e majority_function_tb.o --workdir WORK
	ghdl -a -o majority_function.o -e majority_function.o --workdir WORK
	ghdl -a -o majority_function_tb.o -e majority_function_tb.o --workdir WORK
	ghdl -a -o majority_function.o -e majority