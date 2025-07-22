module example7_16(x1, x2, x3, Clock, f, g);
input x1, x2, x3, Clock;
output f, g
wire [N-1:0] d;
assign f = d[0];
assign g = d[1];
/_