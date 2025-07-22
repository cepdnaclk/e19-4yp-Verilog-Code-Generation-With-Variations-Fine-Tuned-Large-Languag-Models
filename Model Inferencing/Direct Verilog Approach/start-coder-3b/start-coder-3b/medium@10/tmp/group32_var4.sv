module latch(set, reset, d, q);
input set, reset;
input[3:0] d;
output q;
// Generate a set/reset latch (Q = 1, initially)
always@(set or reset)
case (set)
8'h00000000 : (1,1) : q = 1;
8'h00000001 : (1,0) : q = 1;
8'h00000010 : (0,