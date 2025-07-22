module test;

packed my_struct;
reg x, y, z;
my_struct my_struct_packed;

assign my_struct_packed.x = x;
assign my_struct_packed.y = y;
assign my_struct_packed.z = z;

always begin
    x = my_struct_packed.x;
    y = my_struct_packed.y;
    z = my_struct_packed.z;
end
endmodule


## References

https://stackoverflow.com/questions/25534700/verilog-pack-unpack-module
https://hackaday.com/2013/05/23/struct-packing-in-vhdl/
https://stackoverflow.com/questions/63420878/how-to-define-a-packed-structure-in-verilog
https://www.xilinx.com/support/documentation/sw_manuals/xilinx2016_1/ug476-verilog-ps.pdf

### Additional Resources

https://www.edaplayground.com/x/Q2a

## Summary
/Lab4/lab4.md
# Lab 4

## Introduction

This lab covers the basics of signal processing in Verilog by looking at the use of D flip flops and combinatorial logic to control it. It will be explored in detail the use of a clock and its effect on the simulation of Verilog based on the input waveforms provided.

## Materials

You will need:

* 1x Bread Board
* 1x Hspice software with sample input waveforms from project

## Setup

1. Use the sample input waveforms from the project to load into Hspice.
2. Select simulation in Project Manager

## Task

- Explain the operation of the D flipflop and its different modes of behavior.

For D flip-flop, there are 5 modes of behavior.

- 00: T0 = 0; T1 = 0
- 01: T0 = 0; T1 = 1
- 10: T0 = 1; T1 = 0
- 11: T0 = 1; T1 = 1
- Z:   Always 0

- Explain the operation of the D flipflop and its different modes of behavior.

- Explain the operation of the D flipflop and its different modes of behavior.

- Explain the operation of the D flipflop and its different modes of behavior.

## Resources

https://www.edaplayground.com/x/J3P

## Summary

This lab covers the basics of signal processing in Verilog by looking at the use of D flip flops and combinatorial logic to control it. It will be explored in detail the use of a clock and its effect on the simulation of Verilog based on the input waveforms provided.
/Lab2/Lab2.md
# Lab 2:

## Introduction

This lab covers the basics of Verilog by looking at the fundamental building blocks of the hardware language. It will be explored in detail the use of variable declarations, integer arithmetic, arithmetic operators, conditionals, and loops.

## Materials

You will need:

* 1x Bread Board
* 1x Hspice software with sample input waveforms from project

## Setup

1. Use the sample input waveforms from the project to load into Hspice.
2. Select simulation in Project Manager

## Task

For all parts, use the simulator to verify your results.

1. Create a module called "test" werived from the value of variable "a" at the time it is evaluated.

(c)

The value of this variable will change every time the clock rises. The integer value is incremented by one every time a 1 is detected.

(d)

The value of this variable will change every time the clock rises. The integer value is incremented by one every time a 1 is detected.

(e)

The value of this variable will change every time the clock rises. The integer value is incremented by one every time a 1 is detected.

(f)

The value of this variable will change every time the clock rises. The integer value is incremented by one every time a 1 is detected.

(g)

The value of this variable will change every time the clock rises. The integer value is incremented by one every time a 1 is detected.

(h)

The value of this variable will change every time the clock rises. The integer value is incremented by one every time a 1 is detected.

## Resources

[VHDL to Verilog Converter](https://www.edaplayground.com/x/K5r)

## Summary

This lab covers the basics of Verilog by looking at the fundamental building blocks of the hardware language. It will be explored in detail the use of variable declarations, integer arithmetic, arithmetic operators, conditionals, and loops.
ith a single wire output and input. Use a combination of combinatorial logic operators to implement the following logic function (use the truth-table):

![](https://assets.digitalocean.com/articles/vhdl_to_verilog/table1.JPG)

- Write the test module in Verilog.
- Verify in Hspice that:
  - The output is 1 whenever the inputs a & b are 1
  - The output is 0 whenever the inputs a & b are 0

(a)

The value of this variable will change every time the clock rises. The integer value is incremented by one every time a 1 is detected.

(b)

The value of this variable will change every time the clock rises. The integer value is incremented by one every time a 1 is detected.

(c)

The value of this variable will change every time the clock rises. The integer value is incremented by one every time a 1 is detected.

(d)

The value of this variable will change every time the clock rises. The integer value is incremented by one every time a 1 is detected.

(e)

The value of this variable will change every time the clock rises. The integer value is incremented by one every time a 1 is detected.

(f)

The value of this variable will change every time the clock rises. The integer value is incremented by one every time a 1 is detected.

(g)

The value of this variable will change every time the clock rises. The integer value is incremented by one every time a 1 is detected.

(h)

The value of this variable will change every time the clock rises. The integer value is incremented by one every time a 1 is detected.

## Resources

## Summary

This lab covers the basics of Verilog by looking at the fundamental building blocks of the hardware language. It will be explored in detail the use of variable declarations, integer arithmetic, arithmetic operators, conditionals, and loops.

## Introduction

This lab covers the basics of Verilog by looking at the fundamental building blocks of the hardware language. It will be explored in detail the use of variable declarations, integer arithmetic, arithmetic operators, conditionals, and loops.

## Materials

You will need:

* 1x Bread Board
* 1x Hspice software with sample input waveforms from project

## Setup

1. Use the sample input waveforms from the project to load into Hspice.
2. Select simulation in Project Manager

## Task

For all parts, use the simulator to verify your results.

1. Create a module called "test" with a single wire output and input. Use a combination of combinatorial logic operators to implement the following logic function (use the truth-table):

![](https://assets.digitalocean.com/articles/vhdl_to_verilog/table1.JPG)

- Write the test module in Verilog.
- Verify in Hspice that:
  - The output is 1 whenever the inputs a & b are 1
  - The output is 0 whenever the inputs a & b are 0

## Resources

## Summary

This lab covers the basics of Verilog by looking at the fundamental building blocks of the hardware language. It will be explored in detail the use of variable declarations, integer arithmetic, arithmetic operators, conditionals, and loops.

## Introduction

This lab covers the basics of Verilog by looking at the fundamental building blocks of the hardware language. It will be explored in detail the use of variable declarations, integer arithmetic, arithmetic operators, conditionals, and loops.

## Materials

You will need:

* 1x Bread Board
* 1x Hspice software with sample input waveforms from project

## Setup

1. Use the sample input waveforms from the project to load into Hspice.