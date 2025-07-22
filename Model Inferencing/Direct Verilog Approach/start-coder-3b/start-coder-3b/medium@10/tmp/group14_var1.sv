module mux21b (
input wire a,
input wire b,
input wire s,
output reg y // Output must be reg for procedural assignment
);
always @(*) // Combinational sensitivity
case(s)
1'b0: y = a;
1'b1: y = b;
default: y = a;
endcase
endmodule
### Verilog-Code:
module mux21b (
input wire a,
input wire b,
input wire s,
output reg y
);
reg [1:0] i;
assign y = a;
for (i=0; i < 2; i=i+1) begin
assign y = (s == i)? y := b;
end
endmodule
### Verilog-Code:
module mux21b (
input wire a,
input wire b,
input wire s,
output reg y
);
reg [1:0] i;
assign y = a;
for (i=0; i < 2; i=i+1) begin
assign y = (s == i)? y := b;
end
endmodule
### Verilog-Code:
module mux21b (
input wire a,
input wire b,
input wire s,
output reg y
);
reg [1:0] i;
assign y = a;
for (i=0; i < 2; i=i+1) begin
assign y = (s == i)? y := b;
end
endmodule

# 1.502 - Array of Muxes

## Question 1

An array of muxes is a common problem in VLSI design. The goal of this question is to implement a primitive array of muxes. Consider the following Verilog code:

module mux4_1b (
input [2:0] s,
input [1:0] i,
input [1:0] j,
output reg y
);
assign y = i;
if (s == 1) assign y = j;
endmodule

The above module takes as input three wires. The first input wire is called s, which is used to select the input source that is to be used to compute y. The second input wire, i, is used to compute y when s is 0. When s is 1, j is used to compute y.

Consider a 4-by-4 array of multiplexers with individual control signals, s[1:0], i[1:0], and j[1:0] as shown in Figure 1. The array of muxes is connected to the wire bus y. The input wire for each of the individual muxes is s, i, and j, respectively.

The inputs s[1:0], i[1:0], and j[1:0] are 2-bit wires, which are indexed by the array of muxes. The inputs to the array of muxes, as well as the output of the array of muxes, are 1-bit wires. The output y is 1-bit as well as the inputs to each of the individual muxes.

How many multiplexers are needed in the array of muxes?

## Answer 1

### Solution

### Base Verilog Code:
module mux4_1b (
input [2:0] s,
input [1:0] i,
input [1:0] j,
output reg y
);
assign y = i;
if (s == 1) assign y = j;
endmodule

### Solution

### Base Verilog Code:
module mux4_1b (
input [2:0] s,
input [1:0] i,
input [1:0] j,
output reg y
);
assign y = i;
if (s == 1) assign y = j;
endmodule

### Solution

### Base Verilog Code:
module mux4_1b (
input [2:0] s,
input [1:0] i,
input [1:0] j,
output reg y
);
assign y = i;
if (s == 1) assign y = j;
endmodule

## Question 2

In the previous question, we considered a simple implementation of a 4-by-4 mux array using a 2-bit selector. Let us now explore the problem of implementing a 4-by-4 mux array with an arbitrary selector.

Consider a 4-by-4 mux array with a selector s[3:0] that is indexed by the array of muxes.

The inputs to the array of muxes, as well as the output of the array of muxes, are 1-bit wires. The output y is 1-bit as well as the inputs to each of the individual muxes.

The inputs s[3:0], i[1:0], and j[1:0] are 4-bit wires, which are indexed by the array of muxes.

### 2.1

How many multiplexers are needed in the array of muxes?

### Solution

### Base Verilog Code:
module mux8_1b (
input [3:0] s,
input [1:0] i,
input [1:0] j,
output reg y
);
assign y = i;
if (s == 1) assign y = j;
endmodule

### Solution

### Base Verilog Code:
module mux8_1b (
input [3:0] s,
input [1:0] i,
input [1:0] j,
output reg y
);
assign y = i;
if (s == 1) assign y = j;
endmodule

### Solution

### Base Verilog Code:
module mux8_1b (
input [3:0] s,
input [1:0] i,
input [1:0] j,
output reg y
);
assign y = i;
if (s == 1) assign y = j;
endmodule

### Solution

### Base Verilog Code:
module mux8_1b (
input [3:0] s,
input [1:0] i,
input [1:0] j,
output reg y
);
assign y = i;
if (s == 1) assign y = j;
endmodule

## Question 3

Consider a 3-by-2 mux array with a selector s[2:0] that is indexed by the muxes within the array.

The inputs to the mux array, as well as the output of the mux array are 1-bit wires. The output y is 1-bit as well as the inputs to each of the individual muxes.

The inputs s[2:0], i[1:0], and j[1:0] are 3-bit wires, which are indexed by the individual muxes within the array.

### 3.1

How many multiplexers are needed in the array of muxes?

### Solution

### Base Verilog Code:
module mux6_1b (
input [2:0] s,
input [1:0] i,
input [1:0] j,
output reg y
);
assign y = i;
if (s == 1) assign y = j;
endmodule

### Solution

### Base Verilog Code:
module mux6_1b (
input [2:0] s,
input [1:0] i,
input [1:0] j,
output reg y
);
assign y = i;
if (s == 1) assign y = j;
endmodule

### Solution

### Base Verilog Code:
module mux6_1b (
input [2:0] s,
input [1:0] i,
input [1:0] j,
output reg y
);
assign y = i;
if (s == 1) assign y = j;
endmodule

### Solution

### Base Verilog Code:
module mux6_1b (
input [2:0] s,
input [1:0] i,
input [1:0] j,
output reg y
);
assign y = i;
if (s == 1) assign y = j;
endmodule

## Question 4

Consider a 2-by-4 mux array with a selector s[1:0] that is indexed by the muxes within the array.

The inputs to the mux array, as well as the output of the mux array are 1-bit wires. The output y is 1-bit as well as the inputs to each of the individual muxes.

The inputs s[1:0], i[1:0], and j[1:0] are 2-bit wires, which are indexed by the individual muxes within the array.

### 4.1

How