module par(in, parity, all_ones);
input [7:0] in;
output parity, all_ones;
wire [3:0] x1, x2, x3, x4;
struct packed {
logic p1, p2, p3, p4;
} w1, w2;
struct packed {
logic and0;
logic and1;
} w3, w4;
assign x1 = in[3:0];
assign x2 = in[7:4];
assign x3 = in[0];
assign x4 = in[0];
assign w1 = {in[7],in[6],in[5],in[4]};
assign w2 = {in[3],in[2],in[1],in[0]};
assign w3 = {|x1,|x2};
assign w4 = {|x3,|x4};
assign parity = ^{w1,w2};
assign all_ones = w3.and0 & w4.and0;
end