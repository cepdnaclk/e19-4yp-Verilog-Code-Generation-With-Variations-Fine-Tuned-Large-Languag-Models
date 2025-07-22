module mux_41(input [2:0] in, output [3:0] y1, y2, y3, y4);
input [2:0] in;
output [3:0] y1, y2, y3, y4;

assign y1 = {y1[0], in[0]};
assign y2 = {y1[1], in[1]};
assign y3 = {y2[1], in[2]};
assign y4 = {y3[1], in[3]};

endmodule

module mux_22(input [2:0] in, output [3:0] y1, y2, y3, y4);
input [2:0] in;
output [3:0] y1, y2, y3, y4;

assign y1 = {y1[0], in[0], in[1]};
assign y2 = {y1[1], in[1], in[2]};
assign y3 = {y2[1], in[2], in[3]};
assign y4 = {y3[1], in[3], in[0]};

endmodule

### Modified Verilog Code:

module mux_41(input [2:0] in, output [3:0] y1, y2, y3, y4);
input [2:0] in;
output [3:0] y1, y2, y3, y4;

assign y1 = {y1[0], in[0]};
assign y2 = {y1[1], in[1]};
assign y3 = {y2[1], in[2]};
assign y4 = {y3[1], in[3]};

endmodule

module mux_22(input [2:0] in, output [3:0] y1, y2, y3, y4);
input [2:0] in;
output [3:0] y1, y2, y3, y4;

assign y1 = {y1[0], in[0], in[1]};
assign y2 = {y1[1], in[1], in[2]};
assign y3 = {y2[1], in[2], in[3]};
assign y4 = {y3[1], in[3], in[0]};

endmodule

## Exercise 4:

Implement a 2-input N-ary Adder using the following components, and implement a testbench to verify the output value of the adder (using the truth table) when all inputs are either 0 or 1 at the same time:

• Two-input N-ary Adder

The inputs to the adder are: s0, s1, c0, and c1.

The output should be: sum, and carry.

### Base Verilog Code:

module adder3(input [1:0