```verilog
module tst_mup; // Testbench for Microprocessor

reg clk, en, int; // Clock, Enable, Interrupt inputs

// Assuming mup_opr is the microprocessor module instance

// mup_opr rr(clk,int,en); // Instantiation needed

initial

begin

int=1'b0; clk=1'b0; en=1'b0; // Initialize

end

always #2 clk=~clk; // Generate clock

// Monitor clock, time, inputs, and internal MUP registers (pc, ir, dcop)

initial $monitor("clk=%b, t=%0d, en=%b, int=%b, rr.pc=%0d, rr.ir=%0h, rr.dcop=%0d", clk,$time,en,int,rr.pc,rr.ir,rr.dcop);

// Corrected format specifiers

// mup_opr rr(clk,int,en); // Instantiate DUT

initial #40 $stop; // Stop simulation

endmodule

```

/Lab_03/README.md
# Lab_03

## Overview

This lab introduces the following topics:
- Basic Verilog module
- Input and output data types
- Assignment statements
- If/else conditional statements
- Loops (for, while)
- Module instantiation
- Verilog simulation
- `posedge`/`negedge` synthesis constraint
- Verilog coverage

## Project 1: Adder Module

### Introduction

The goal of the project is to create a simple adder module and test it using a testbench. To test the adder module, a testbench is necessary. The testbench should simulate the following test cases:

- Test case 1: Test the input and output of the adder module
- Test case 2: Test correct sum value
- Test case 3: Test overflow
- Test case 4: Test carry-out signal
- Test case 5: Test carry-in signal

The first 3 test cases (1, 2, 3) are required for the adder module, which can be implemented using any of the methods taught in class. The last 2 test cases (4, 5) are optional.

### Step 1: Writing the Base Verilog Code

Following is the base Verilog code for the adder module (with a carry-out signal):

```verilog
/* Adder module with carry-out output */
module adder(
    in a,
    in b,
    in cin,
    out s,
    out cout);
 
/* Define module ports */
input a, b, cin;
output s, cout;
 
/* Addition logic */
assign s = a ^ b ^ cin;
assign cout = a & b | (a & cin) | (b & cin);
endmodule
```

### Step 2: Writing the Variation Instruction

Write the variation instruction for the adder module in the `Lab_03_Instructions.pdf`.

### Step 3: Writing the Variation Code

Write the variation code for the adder module in the `Lab_03_Code.pdf`.

### Step 4: Writing the Testbench Code

Following is the base Verilog code for the testbench:

```verilog
/* Basic testbench for the adder module */
 
module tst_adder;
 
/* Declare module ports */
reg a, b, cin, s, cout, clk;
 
/* Declare local signals */
reg [3:0] s_correct, s_check, cout_correct, cout_check;
 
/* Instantiate adder module */
adder adder_inst(
   .a(a),
   .b(b),
   .cin(cin),
   .s(s),
   .cout(cout)
  );
 
/* Initialize module signals */
initial
begin
    a = 1'b1;
    b = 1'b1;
    cin = 1'b0;
end
 
/* Set clock signal */
always #2 clk = ~clk;
 
/* Instantiate coverage */
initial $coverage;
 
/* Check output */
initial $monitor("clk