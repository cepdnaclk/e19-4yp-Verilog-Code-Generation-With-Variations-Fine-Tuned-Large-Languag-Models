module example7_5(x1, x2, x3, Clock, f, g);
input x1, x2, x3, Clock;
output f, g;
reg f, g;
reg [2:0] a1, a2, a3, a4;
int b1, b2, b3, b4;
always @(posedge C