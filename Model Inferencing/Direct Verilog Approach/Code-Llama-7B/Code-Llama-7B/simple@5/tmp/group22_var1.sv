module par_struct(in, parity, all_ones);
input [7:0] in;
output parity, all_ones;
struct packed {logic x1, x2, x3, x4; } all_x;
struct packed