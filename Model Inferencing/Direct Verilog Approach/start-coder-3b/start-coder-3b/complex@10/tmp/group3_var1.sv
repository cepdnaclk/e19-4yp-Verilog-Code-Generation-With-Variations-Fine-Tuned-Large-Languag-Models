module Prob_7 (A, B, C, D, out);
// Combinational logic circuit
input A, B, C, D;
output out;
reg [1: 0] clk, next_clk;
wire a, b, c, d;
wire f, g, h, e;
wire [3: 0] f_i, g_i, h_i, e_i;
assign { a, b, c, d } = { A, B, C, D };
assign f_i[3: 0] = { d, d ^ a, d ^ b, d ^ c };
assign g_i[3: 0] = { d, d ^ a, c ^ d, c ^ b };
assign h_i[3: 0] = { d, a ^ d, b ^ d, c ^ d };
assign e_i[3: 0] = { d, b ^ a, b ^ c, d ^ c };
always @ (posedge clk) next_clk <= clk;
assign out = f_i[0] & g_i[0] & h_i[0] & e_i[0];
endmodule


### Result

It gives correct output for first clock cycle and then outputs are same as in previous case.

## Problem 8

### Base Verilog Code:
module Prob_8 (A, B, C, D, out, clk, rst);
// Combinational logic circuit
input A, B, C, D;
output out;
reg [1: 0] clk, next_clk;
input rst;
parameter S_0 = 0, S_1 = 1, S_2 = 2, S_3 = 3, S_4 = 4, S_5 = 5, S_6 = 6, S_7 = 7;
wire a, b, c, d;
wire f, g, h, e;
wire [3: 0] f_i, g_i, h_i, e_i;
assign { a, b, c, d } = { A, B, C, D };
assign f_i[3: 0] = { d, d ^ a, d ^ b, d ^ c };
assign g_i[3: 0] = { d, d ^ a, c ^ d, c ^ b };
assign h_i[3: 0] = { d, a ^ d, b ^ d, c ^ d };
assign e_i[3: 0] = { d, b ^ a, b ^ c, d ^ c };
always @ (posedge clk) next_clk <= clk;
always @ (posedge rst) if (rst) clk <= 0; else clk <= next_clk;
always @ (state_Moore, D_in) begin
next_state = S_0;
case (state_Moore)
S_0: if (D_in) next_state = S_1; else if (D_in == 0) next_state = S_5;
S_1: if (D_in) next_state = S_2; else if (D_in == 0) next_state = S_5;
S_2: if (D_in) next_state = S_3; else if (D_in == 0) next_state = S_5;
S_3: if (D_in) next_state = S_3; else if (D_in == 0) next_state = S_4;
S_4: if (D_in) next_state = S_1; else if (D_in == 0) next_state = S_6;
S_5: if (D_in) next_state = S_1; else if (D_in == 0) next_state = S_6;
S_6: if (D_in) next_state = S_1; else if (D_in == 0) next_state = S_7;
S_7: if (D_in) next_state = S_8; else if (D_in == 0) next_state = S_7;
S_8: if (D_in) next_state = S_1; else if (D_in == 0) next_state = S_6;
default: next_state = S_0;
endcase
end
end