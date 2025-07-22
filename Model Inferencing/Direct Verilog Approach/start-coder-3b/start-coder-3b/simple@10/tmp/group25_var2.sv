module mos_strength (a, c, zn, zp);
input a, c;
output zn, zp;
mos_strength_enum (zn, a, c);
mos_strength_enum (zp, a, c);
endmodule

module mos_strength_enum(out_signal, in_a, in_c);

input [15:0] in_c, in_a;
output [15:0] out_signal;

assign out_signal = {in_a, in_a} ^ in_c;

endmodule

## Question 3: How can you implement a one-hot decoder?

1. One-hot decoder
module one_hot_decoder (in, out);
input [3:0] in;
output [3:0] out;

assign out = in;

endmodule

## Question 4: How do you create a multiplexer in Verilog?

1. Multiplexer in Verilog
module mux4_1 (a, b, s, x, y, z);
input [3:0] a, b, x, y, z;
output [3:0] s;

assign s = {x, y, z}? a : b;

endmodule

## Question 5: For the following equation, give the decimal equivalent.

1. NAND gate
$S = \overline{ A }\overline{ B }$

2. OR gate
$S = A + B$

## Question 6: How do you create a 2 to 1 multiplexer?

1. Multiplexer
module mux2_1 (a, b, s, x, y);
input [1:0] a, b, x, y;
output s;

assign s = {x, y}? a : b;

endmodule

## Question 7: How do you implement a full adder in Verilog?

1. Two Full Adders
module full_adder (a, b, cin, sum, cout);
input a, b, cin;
output sum, cout;

wire t1, t2, t3, t4;
t1 = a xor b;
t2 = a and b;
t3 = t1 and b;
t4 = t1 and a;

assign sum = (t3 << 1) ^ t1;
assign cout = t2 or t3 or t4;

endmodule

## Question 8: How can you implement a 2-bit comparator?

1. 2-bit comparator
module comparator2 (in0, in1, out, cmp_out);
input in0, in1;
output out, cmp_out;

wire [1:0] diff;

assign diff = in0 ^ in1;
assign cmp_out = ~diff;

case (diff)
2'd0:
out = 1'b0;
break;
2'd1:
out = 1'b1;
break;
default:
out = 1'b0;
endcase

endmodule

## Question 9: How do you create a comparator in Verilog?

1. Comparator
module comparator (in0, in1, out);
input in0, in1;
output out;

comparator7 (out, in0, in1);

endmodule

2. Comparator
module comparator7 (out, in0, in1);
input in0, in1;
output out;

comparator7_s (out, in0, in1);

endmodule

3. Comparator
module comparator7_s (out, in0, in1);
input in0, in1;
output out;

out = in0 > in1;

endmodule

## Question 10: How do you create a 4-bit comparator?

1. 4-bit comparator
module comparator4 (in0, in1, out, cmp_out);
input in0, in1;
output out, cmp_out;

wire [3:0] diff;

assign diff = in0 ^ in1;
assign cmp_out = ~diff;

case (diff)
4'd0:
out = 1'b0;
break;
4'd1:
out = 1'b1;
break;
default:
out = 1'b0;
endcase

endmodule

## Question 11: How can you implement a 4 input AND gate?

1. 4-input AND Gate
module and4 (in0, in1, in2, in3, out);
input in0, in1, in2, in3;
output out;

assign out = in0 & in1 & in2 & in3;

endmodule

## Question 12: How do you implement an 8 to 1 multiplexer and implement its truth table?

$S = {000,0,0,0,1,1,1,1} {001,0,0,1,0,0,0,1} {010,0,0,1,1,0,1,0} {100,0,1,0,0,1,0,0} {101,0,1,0,1,1,1,1} {110,0,1,1,0,0,0,1} {111,0,1,1,1,1,1,1}$

1. 8-to-1 Multiplexer
module mux8_1 (a, b, s, x, y, z, z1, z2, z3);
input [3:0] a, b, x, y, z, z1, z2, z3;
output [3:0] s;

assign s =
{z2, z3} & {y, z}? a : b :
{z1} & {x, z}? a : b :
{z1, z2} & {x, y}? a : b :
{z1, z3} & {x, z1}? a : b :
{z2, z3} & {y, z1}? a : b :
{z1, z2, z3}? a : b :
1'b1 :
{x, z1, z2, z3}? a : b;

endmodule

## Question 13: How do you implement a 4 to 1 multiplexer and implement its truth table?

$S = {000,0,0,0,1,1,1,1} {001,0,0,1,0,0,0,1} {010,0,1,0,1,0,1,0} {011,0,1,1,1,1,1,1} {100,1,0,0,0,1,0,0} {101,1,0,1,1,1,1,1} {110,1,1,0,0,0,0,1} {111,1,1,1,1,1,1,1}$

1. 4-to-1 Multiplexer
module mux4_1 (a, b, s, x, y);
input [1:0] a, b, x, y;
output [1:0] s;

assign s =
{y} & {x}? a : b :
{x}? a : b;

endmodule

## Question 14: How do you implement a 4 input OR gate?

1. 4-input OR gate
module or4 (in0, in1, in2, in3, out);
input in0, in1, in2, in3;
output out;

assign out = in0 | in1 | in2 | in3;

endmodule

## Question 15: How do you create a 2-bit to 4-bit decoder?

1. 2-bit to 4-bit Decoder
module decoder2_4 (in0, in1, out0, out1, out2, out3);
input [1:0] in0, in1;
output [3:0] out0, out1, out2, out3;

assign out0 = in0;
assign out1 = in1;
assign out2 = (in0, in1) << 2;
assign out3 = in0 & in1;

endmodule

## Question 16: How do you implement a counter?

1. 4-bit counter
module counter4 (clk, rst, count, cout);
input clk, rst;
output [3:0] count;

always @(posedge clk)
if (rst == 1'b1)
count <= 4