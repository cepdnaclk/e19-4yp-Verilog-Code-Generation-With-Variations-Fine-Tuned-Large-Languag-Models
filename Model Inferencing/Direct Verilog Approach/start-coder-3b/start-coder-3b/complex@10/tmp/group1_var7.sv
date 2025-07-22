```Verilog
module tst_nor3NMOS();
  reg in1,in2,in3; wire b;
  generate // Corrected: was `generate(1)
    NOR3NMOS gen_block1(in1,in2,in3,b)
  endgenerate
  // Toggle inputs at different rates
  always #2 in1=~in1; // Corrected: was 1'b1
  always #3 in2=~in2;
  always #5 in3=~in3;
  initial $monitor($time, "in1 = %b, in2 = %b, in3 = %b, output = %b ",in1,in2,in3,b); // Removed newline
  initial #24 $stop; // Stop simulation
endmodule
```---
title: "Week 2"
output: html_notebook
---

# Week 2 notes (week of 9/1/2020 to 9/8/2020)

## Agenda for Monday 9/1/2020:

- Review last week’s lectures (in general)
- Review homework 1 (in general)
- Review lab
- Review last week’s homework
- Review last week’s code
- Review last week’s lab report
- Discuss next week’s lectures / homework

## Agenda for Tuesday 9/2/2020:

- Review lectures for next week
- Review homework 2 (in general)
- Review lab
- Review last week’s homework
- Review last week’s code
- Review last week’s lab report
- Discuss next week’s lectures / homework

## Agenda for Wednesday 9/3/2020:

- Review lectures for next week
- Review homework 3 (in general)
- Review lab
- Review last week’s homework
- Review last week’s code
- Review last week’s lab report
- Discuss next week’s lectures / homework

# Monday 9/1/2020

## Review last week’s lectures (in general)
- Last week we discussed the basics of Verilog and its syntax, as well as how to use the Verilator simulator. We also reviewed the Vivado synthesis and simulation steps.

## Review homework 1 (in general)
- For homework 1, you will be required to create a basic Verilog module. You must demonstrate and discuss the module’s behavior and its design’s functionality in Vivado. You will be required to use a combination of verilog and text editing software to build and edit your module.
- Your task is to write a Verilog module called `testbench.v` that is used to test the behavior of a 3-input NAND gate.
- Start by creating a new Verilog module called `testbench.v`.
- The `testbench.v` should use a 3-input NAND gate.
- You can use Verilog syntax and text editing software to build your module.
- You must demonstrate and discuss the module’s behavior and its design’s functionality in Vivado.
- This is a good opportunity to get you familiar with syntax and basic Verilog commands.
- You can use the `testbench.v` code, `testbench.runs_in_verilator.txt`, and `testbench.runs_in_vivado.txt` files as examples to implement your module.
- Your `testbench.v` should have the following lines:
```
module testbench();
// Instantiate NAND gate
nand3_gate nand3(in1,in2,in3,out);
// Initialize inputs
in1=1'b0; in2=1'b0; in3=1'b0;
initial begin
initial #5 $monitor($time, "Input 1 = %b, Input 2 = %b, Input 3 = %b, Output = %b",in1,in2,in3,out); // Removed newline
end
```

## Review lab
- In the lab, you will be required to use the Vivado Synthesis and Simulation steps to build and simulate a Verilog module (which can be any module you choose).
- You will also be required to use the Vivado Implementation and Programming steps to program a FPGA board (you will be using a DE2 board).

## Review last week’s homework
- For homework 1, you will be required to create a basic Verilog module. You must demonstrate and discuss the module’s behavior and its design’s functionality in Vivado. You will be required to use a combination of verilog and text editing software to build and edit your module.
- Your task is to write a Verilog module called `testbench.v` that is used to test the behavior of a 3-input NAND gate.
- Start by creating a new Verilog module called `testbench.v`.
- The `testbench.v` should use a 3-input NAND gate.
- You can use Verilog syntax and text editing software to build your module.
- You must demonstrate and discuss the module’s behavior and its design’s functionality in Vivado.
- This is a good opportunity to get you familiar with syntax and basic Verilog commands.
- You can use the `testbench.v` code, `testbench.runs_in_verilator.txt`, and `testbench.runs_in_vivado.txt` files as examples to implement your module.
- Your `testbench.v` should have the following lines:
```
module testbench();
// Instantiate NAND gate
nand3_gate nand3(in1,in2,in3,out);
// Initialize inputs
in1=1'b0; in2=1'b0; in3=1'b0;
initial begin
initial #5 $monitor($time, "Input 1 = %b, Input 2 = %b, Input 3 = %b, Output = %b",in1,in2,in3,out); // Removed newline
end
```

## Review last week’s code
- For homework 1, you will be required to create a basic Verilog module. You must demonstrate and discuss the module’s behavior and its design’s functionality in Vivado. You will be required to use a combination of verilog and text editing software to build and edit your module.
- Your task is to write a Verilog module called `testbench.v` that is used to test the behavior of a 3-input NAND gate.
- Start by creating a new Verilog module called `testbench.v`.
- The `testbench.v` should use a 3-input NAND gate.
- You can use Verilog syntax and text editing software to build your module.
- You must demonstrate and discuss the module’s behavior and its design’s functionality in Vivado.
- This is a good opportunity to get you familiar with syntax and basic Verilog commands.
- You can use the `testbench.v` code, `testbench.runs_in_verilator.txt`, and `testbench.runs_in_vivado.