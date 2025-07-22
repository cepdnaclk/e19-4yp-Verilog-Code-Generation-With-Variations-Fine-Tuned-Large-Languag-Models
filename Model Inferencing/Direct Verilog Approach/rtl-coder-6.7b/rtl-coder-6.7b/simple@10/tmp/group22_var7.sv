module par_struct(x1, x2, x3, x4, parity, all_ones);
typedef struct packed {
logic [3:0] y1;
logic [3:0] y2;
logic [3:0] y3;
logic [3:0] y4;
} par_struct_t;
input logic [3:0] x1, x2, x3, x4;
output parity, all_ones;
par_struct_t x, y;
assign x = '{x1, x2, x3, x4};
assign y = '{x2, x3, x4, x1};
par par1(x.y1, x.y2, x.y3, x.y4, parity, all_ones);
par par2(y.y1, y.y2, y.y3, y.y4, parity, all_ones);
endmodule
### Base Verilog Code:
module par(in, parity, all_ones);
input [7:0] in;
output parity, all_ones;
assign parity = ^in;
assign all_ones =