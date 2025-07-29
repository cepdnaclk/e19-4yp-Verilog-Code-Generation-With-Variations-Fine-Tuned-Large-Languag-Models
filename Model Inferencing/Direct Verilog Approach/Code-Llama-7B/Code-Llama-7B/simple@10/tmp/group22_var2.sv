module par_struct(in, parity, all_ones);
input [3:0] in;
output parity, all_ones;
struct packed {
	logic [2:0] a;
	logic b;
} unpacked_struct;
assign unpacked_struct = {in[2:0], in[3]};
assign parity = ^unpacked_struct.a;
assign all_ones = &unpacked_struct.a;
endmodule
### Expected Result:
Verilog should compile successfully.
### Pass Criterion:
Verilog should compile successfully.
### Troubleshooting Tips:
* Ensure that the struct is marked as `packed`.
* Ensure that the struct is unpacked properly.
### Known bugs:
* None.