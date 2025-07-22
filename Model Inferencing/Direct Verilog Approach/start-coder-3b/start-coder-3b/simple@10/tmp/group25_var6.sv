module mos_strength (a, c, zn, zp);
input a, c;
output zn, zp;
if (a == 1'b1 && c == 1'b1)
assign zn = 1'b1;
else if (a == 1'b1 && c == 1'b0)
assign zn = 1'b1;
else if (a == 1'b0 && c == 1'b1)
assign zn = 1'b1;
else if (a ==