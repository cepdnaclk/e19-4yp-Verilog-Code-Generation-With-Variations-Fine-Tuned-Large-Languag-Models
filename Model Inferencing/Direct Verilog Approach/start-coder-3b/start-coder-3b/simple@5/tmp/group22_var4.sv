module par(in, parity, all_ones);
input [7:0] in;
output parity, all_ones;
logic[7:0] packed;
assign parity = ^in;
assign all_ones = &in;
assign packed = in;
endmodule

## P.3.4 Summary

The goal of this activity was to design a 4-bit parallel-to-serial converter. This was accomplished by designing a 3-to-8 decoder and implementing a 4-to-1 mux. The parallel-to-serial converter was then tested by using an 8-to-1 multiplexer to convert between binary and decimal numbers, demonstrating the capabilities of the Verilog HDL.

## P.3.5 Lab Report

### P.3.5.1 Design

#### P.3.5.1.1 Parity Calculator

The design flow for the parity calculator was completed as follows:
The input code was initially created wherein a module was defined to have 7 input bits and 2 output bits. The output bits were assigned the inputs using Verilog assignment operations. The code was then verified using the Verilog testbench. The code was then tested using the Verilog simulator.

### P.3.5.2 Test

#### P.3.5.2.1 Parity Calculator

The design was tested using the following test cases:

Test
Input
Output
Hexadecimal
0
0
0
1
1
0
2
1
1
4
0
1
8
1
1
16
1
0
32
0
1
64
1
0
128
1
0
256
0
1
512
1
0
1024
1
0
2048
0
1
4096
1
0
8192
1
0
16384
0
0
32768
1
0
65536
1
0
131072
0
0
262144
1
0
524288
1
0
1048576
0
1
2097152
1
0
4194304
1
0
8388608
1
0
16777216
0
1
33554432
1
0
67108864
1
0
134217728
0
0
268435456
1
0
536870912
1
0
1073741824
0
1
2147483648
1
0
2^32
1
1

## P.3.6 References

[1]. _Verilog HDL_. Wiley, 2013.

[2]. _Digital Systems Design with Verilog HDL_. New York, NY, USA: Mc Graw Hill Professional, 2014.