module par(in, parity, all_ones);
input logic [7:0] in;
output logic parity, all_ones;
struct packed {
	logic [7:0] x;
} in;
assign parity = ^in.x;
assign all_ones = &in.x;
endmodule
### Expected output:
- parity = x ^ x ^ x ^ x
- all_ones = (x & x & x & x)


## Testcase 11
### Base Verilog Code:
module par(in, parity, all_ones);
input logic [7:0] in;
output