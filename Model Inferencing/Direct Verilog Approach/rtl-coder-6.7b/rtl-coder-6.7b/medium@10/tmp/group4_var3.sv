module jk_flip_flop(in, clk, reset, out);
output reg out;
input in, clk, reset;
reg j, k;
reg old_out;
wire net1, net2;