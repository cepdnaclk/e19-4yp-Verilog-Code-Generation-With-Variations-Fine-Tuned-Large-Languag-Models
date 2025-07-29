module test;
wire [29:0] a;
struct packed {reg x; reg y; reg z;} b;
assign #25 a = {17'b0, 1'b1, 1'b0, 1'