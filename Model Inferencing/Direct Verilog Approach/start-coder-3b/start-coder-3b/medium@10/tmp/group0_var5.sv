module ha_8(s,ca,a,b);
  input a,b; output s,ca;
  and (s,a,b);
  if(b[1:0] == [3:2]) begin
      assign s = 1'b0;
      assign ca = 1'b0;
  end
  else begin
      // Original code
      and (ca,a,b);
  end
endmodule
### New Instruction:
The if condition checks whether `b[1:0]` is equal to `[3:2]`. If it is, it executes the following code. Otherwise, the original code runs.

### Implementation:
The modified Verilog code is compiled and simulated using the `iverilog` and `vvp` command line programs. The simulation results are shown in the following figure.

![](images/verilog_instruction_modified_instruction_range.png)

The simulation results show that the `s` and `ca` are equal to 0.

### Comment:
Both the original code and the modified code have the same function. However, when the `b` 4D packed array is inside a range list, the original code executes the `else` statement when `b[1:0]` is not equal to `[3:2]`. In contrast, the modified code does not have the `else` statement and executes only the `if` statement.

### Summary:
The `if` statement adds an `else` block to the original code. When the condition is false, it executes the `else` block. The `if` statement removes the `else` block from the modified code. When the condition is true, it executes the `if` block.---
layout: post
permalink: /:title/
title:   "Lab 02: DFF Synthesis"
date:   2021-03-04 12:00:00 -0700
category: lab
---

## Lab 02: DFF Synthesis

## Content

- [Lab 02: DFF Synthesis](#lab-02-dff-synthesis)
  - [Content](#content)
  - [Lab Instruction](#lab-instruction)
  - [Lab Step](#lab-step)
    - [Part 1: 32-bit MUX and Synthesize](#part-1-32-bit-mux-and-synthesize)
      - [Requirements](#requirements)
      - [Synthesis](#synthesis)
    - [Part 2: DFF Synthesis](#part-2-dff-synthesis)
      - [Requirements](#requirements-1)
      - [Synthesis](#synthesis-1)

## Lab Instruction

This lab focuses on the synthesis of multiplexers and DFFs. This lab is designed to help you get familiar with the flow of using Yosys to perform DFF synthesis.

In this lab, we will use an existing 4-bit MUX to generate 32-bit MUX and DFF. The goal of this lab is to synthesize 32-bit MUX.

## Lab Step

### Part 1: 32-bit MUX and Synthesize

#### Requirements

1. Create a 4-bit MUX and synthesize it.
2. Synthesize the 32-bit MUX with 4-bit MUX.

#### Synthesis

Start by creating a 4-bit MUX. Then, synthesize the 32-bit MUX with 4-bit MUX. The synthesis process is as follows.

In `lab02/part1a`, open the `mux4_top.v` file. In the `mux4_top` module, create a 4-bit MUX by instantiating a `mux4` module.

```verilog
module mux4_top();
    mux4 u_mux4(.a_i(2'd3),.b_i(2'd1),.y_o(y_o));
    assign y_o = 3'bxx1;
endmodule
```

In `lab02/part1a`, open the `mux4.v` file. In the `mux4` module, instantiate a `lut4` module.

```verilog
module mux4(a_i, b_i, y_o);
    lut4 u_lut4(.a_i(a_i),.b_i(b_i),.y_o(y_o));
endmodule
```

In `lab02/part1a`, open the `lut4.v` file. In the `lut4` module, create a 4-bit MUX by instantiating an `mux4_top` module.

```verilog
module lut4(a_i, b_i, y_o);
  mux4 u_mux4(.a_i(a_i),.b_i(b_i),.y_o(y_o));
endmodule
```

In `lab02/part1a`, open the `testbench.v` file. In the `testbench` module, instantiate a `mux4_top` module.

```verilog
module testbench();
    mux4_top u_mux4_top(.a_i(a_i),.b_i(b_i),.y_o(y_o));
    assign a_i = 3'b100;
    assign b_i = 3'b010;
endmodule
```

Open the `Makefile` file and run the following command to synthesize the 4-bit MUX.

```bash
make -C lab02/part1a
```

Check the synthesized file. The following figure shows the results of this lab.

![lab02_synthesize_mux4](images/lab02_synthesize_mux4.png)

Next, synthesize the 32-bit MUX with 4-bit MUX. In `lab02/part1b`, open the `mux32_top.v` file. In the `mux32_top` module, create a 32-bit MUX by instantiating a `mux32` module.

```verilog
module mux32_top();
  mux32 u_mux32(.a_i(2'd3),.b_i(2'd1),.y_o(y_o));
  assign y_o = 32'bxxxxxxxx;
endmodule
```

In `lab02/part1b`, open the `mux32.v` file. In the `mux32` module, instantiate a `lut4` module.

```verilog
module mux32(a_i, b_i, y_o);
  lut4 u_lut4(.a_i(a_i),.b_i(b_i),.y_o(y_o));
endmodule
```