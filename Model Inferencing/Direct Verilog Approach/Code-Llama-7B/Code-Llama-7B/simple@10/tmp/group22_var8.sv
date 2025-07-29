module par(in, parity, all_ones);
input [7:0] in;
output parity, all_ones;
logic [7:0] in_v = in;
logic parity_v, all_ones_v;
assign parity_v = ^in_v;
assign all_ones_v = &in_v;
assign parity = parity_v;