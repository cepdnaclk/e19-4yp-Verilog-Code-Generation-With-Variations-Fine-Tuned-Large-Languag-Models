module sub(a, b, in, out, mask);
input [7:0] a, b;
output [7:0] in;
output out;
output mask;
assign in = a - b;
assign out = in[7];
assign mask = in[7] | in[6] | in[5] | in[4] | in[3] | in[2]