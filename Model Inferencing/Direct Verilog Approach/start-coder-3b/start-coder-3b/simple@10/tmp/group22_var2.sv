module par(in, parity, all_ones);
input [7:0] in;
output parity, all_ones;

struct struct_1{
	logic [7:0] x1;
	logic [7:0] x2;
};
struct struct_1 s;

assign s.x1 = in[0:7];
assign s.x2 = in[8:15];

assign parity = s.x1 ^ s.x2;
assign all_ones = s.x1 & s.x2;
endmodule

## 15.13 Example:
### Base Verilog Code:
module par(in, parity, all_ones);
input [7:0] in;
output parity, all_