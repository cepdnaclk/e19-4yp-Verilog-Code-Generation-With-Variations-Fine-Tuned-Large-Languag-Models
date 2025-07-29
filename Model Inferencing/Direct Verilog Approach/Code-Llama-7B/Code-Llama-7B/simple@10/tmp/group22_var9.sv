module par_struct(in, parity, all_ones);
input [31:0] in;
logic parity, all_ones;
logic [7:0] x1, x2, x3, x4; // 0x1234
assign x1 = in[15:8];
assign x2 = in[7:0];
assign x3 = in[23:16];
assign x4 = in[31:24];