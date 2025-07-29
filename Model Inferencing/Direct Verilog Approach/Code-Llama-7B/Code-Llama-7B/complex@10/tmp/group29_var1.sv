```
module hex7seg (hex, a, b, c, d, e, f, g, dp);
input [3: 0] hex;
output a, b, c, d, e, f, g, dp;
reg a, b, c, d, e, f, g, dp;
wire [6: 0] a, b, c, d, e, f, g, dp;
wire [3: 0] hex;

assign {a, b, c, d, e, f, g, dp} = hex;
assign a = (hex[0] | (hex[3] & hex[2] & hex[1]) | (hex[3] & hex[2] & hex[1]) | (hex[3] & hex[2] & hex[1]));
assign b = (~hex[3] & ~hex[2] & ~hex[1] & ~hex[0]) | (hex[3] & ~hex[2] & ~hex[1] & ~hex[0]) | (~hex[3] & ~hex[2] & ~hex[1] & ~hex[0]) | (hex[3] & ~hex[2] & ~hex[1] & ~hex[0]);
assign c = (~hex[1] & ~hex[0]) | (~hex[1] & ~hex[0]) | (~hex[1] & ~hex[0]) | (~hex[1] & ~hex[0]);
assign d = (~hex[3] & ~hex[2] & ~hex[1] & ~hex[0]) | (~hex[3] & ~hex[2] & ~hex[1] & ~hex[0]) | (~hex[3] & ~hex[2] & ~hex[1] & ~hex[0]) | (~hex[3] & ~hex[2] & ~hex[1] & ~hex[0]);
assign e = (~hex[1] & ~hex[0]) | (~hex[1] & ~hex[0]) | (~hex[1] & ~hex[0]) | (~hex[1] & ~hex[0]);
assign f = (~hex