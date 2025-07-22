module full_adder(i1, i2, cin, sum, cout);
input i1, i2, cin;
output sum, cout;
assign sum = i1 ^ i2 ^ cin;
assign cout = (i1 & i2) | (cin & (i1 | i2));
endmodule
### Input:
Input file full_adder_v.dat contains 2^13-1=8191 combinations of input signals.
### Output:
The output file full_adder_v.log contains the value of the output "cout" for each input combination.
### Testbench Code:
module test_full_adder(i1, i2, cin, sum, cout);
input i1, i2, cin;
output sum, cout;
reg sum, cout;
initial begin
$readmemb("full_adder.dat", {i1, i2, cin, sum, cout});$dumpfile("full_adder_v.log");
$dumpvars(0, test_full_adder); forever begin#13i1 = 1'b0; #13i2 = 1'b0; #13cin = 1'b0; #13cout = 1'b0; #13wait(); #13i1 = 1'b0; #13i2 = 1'b0; #13cin = 1'b1; #13cout = 1'b0; #13wait(); #13i1 = 1'b0; #13i2 = 1'b1; #13cin = 1'b0; #13cout = 1'b1; #13wait(); #13i1 = 1'b0; #13i2 = 1'b1; #13cin = 1'b1; #13cout = 1'b1; #13wait(); #13i1 = 1'b1; #13i2 = 1'b0; #13cin = 1'b0; #13cout = 1'b1; #13wait(); #13i1 = 1'b1; #13i2 = 1'b0; #13cin = 1'b1; #13cout = 1'b1; #13wait(); #13i1 = 1'b1; #13i2 = 1'b1; #13cin = 1'b0; #13cout = 1'b0; #13wait(); #13i1 = 1'b1; #13i2 = 1'b1; #13cin = 1'b1; #13cout = 1'b1; #13wait(); #13end endmodule

References
----------
*  and. **Digital Design Fundamentals.** Prentice-Hall, 2003.
* Xilinx. **Vivado Design Suite User Guide.** August 2016, Version 32.2.0.
*. **Elements of Programming.** Prentice-Hall, 1985. This book was the inspiration for this lab./lab2/lab2-c/lab2-c.md
Lab 2-c
===================

Introduction
-----------
### Goal:
This lab will teach you how to create a design flow using Vivado, create a design using Verilog, and use the simulation to verify the functional correctness of the design.
### Learning Objectives:
* Vivado HLS
* Verilog
* SystemVerilog
* Vivado simulation

Instructions
-----------
### Setup:
* Install Vivado HLS

### Design Requirements:
The design of this lab will be the same as the previous lab. Please refer to the previous lab for details.

### Vivado HLS Simulation:
This lab will be using the same design used in the previous lab, except this lab will be using Vivado HLS simulation tools to run a simulation and then create an executable.

### Simulation:
* Use the simulation tools to create an executable.
* Run the executable
* Open the ILA and use the ILA to view the simulation results.
* Examine the ILA and the simulation results.


Required Resources:
-------------------
* Vivado HLS
* A 7-Series FPGA board
* An ECP5 UltraScale FPGA

### Verilog Source Code:
```
module full_adder(i1, i2, cin, sum, cout);
    input i1, i2, cin;
    output sum, cout;
    assign sum = i1 ^ i2 ^ cin;
    assign cout = (i1 & i2) | (cin & (i1 | i2));
endmodule
```

### Design File:
```
full_adder.v
```

### Simulation Source Code:
```
`timescale 1ns/1ps

module test_full_adder(i1, i2, cin, sum, cout);
    input i1, i2, cin;
    output sum, cout;
    reg sum, cout;
    initial begin
        `$readmemb("full_adder.dat", {i1, i2, cin, sum, cout});
        `$dumpvars(0, test_full_adder);
        forever begin#13i1 = 1'b0; #13i2 = 1'b0; #13cin = 1'b0; #13cout = 1'b0; #13wait(); #13i1 = 1'b0; #13i2 = 1'b0; #13cin = 1'b1; #13cout = 1'b0; #13wait(); #13i1 = 1'b0; #13i2 = 1'b1; #13cin = 1'b0; #13cout = 1'b1; #13wait(); #13i1 = 1'b0; #13i2 = 1'b1; #13cin = 1'b1; #13cout = 1'b1; #13wait(); #13i1 = 1'b1; #13i2 = 1'b0; #13cin = 1'b0; #13cout = 1'b1; #13wait(); #13i1 = 1'b1; #13i2 = 1'b0; #13cin = 1'b1; #13cout = 1'b1; #13wait(); #13i1 = 1'b1; #13i2 = 1'b1; #13cin = 1'b0; #13cout = 1'b0; #13wait(); #13i1 = 1'b1; #13i2 = 1'b1; #13cin = 1'b1; #13cout = 1'b1; #13wait(); #13end
    endmodule
```

### Simulation File:
```
test_full_adder.sv
```

### Simulation File:
```
full_adder.dat
```

### Executable File:
```
top.exe
```

References
----------
*  and. **Digital Design Fundamentals.** Prentice-Hall, 2003.
* Xilinx. **Vivado Design Suite User Guide.** August 2016, Version 32.2.0.
*. **Elements of Programming.** Prentice-Hall, 1985. This book was the inspiration for this lab.
*. **HLS C/C++ Integrated Development Environment.** December 2014, Version 2014.1.0.
*. **Intel® FPGA Programmer's Reference.** February 2015, Version 14.1.
* Wikipedia contributors. (2017, June 7). CMOS inverter. In Wikipedia, The Free Encyclopedia. Retrieved 20:47, June 8, 2017, from https://en.wikipedia.org/w/index.php?title=CMOS_inverter&oldid=783393079
* Wikibooks contributors. (2017, June 7). Digital Logic. In Wikibooks, The Free ticle/details/27817639Book Project. Retrieved 20:47, June 8, 2017, from https://en.wikibooks.org/wiki/Digital_Logic
* HDL Coder. (2017, June 7). Tutorial: Verilog Basics. In