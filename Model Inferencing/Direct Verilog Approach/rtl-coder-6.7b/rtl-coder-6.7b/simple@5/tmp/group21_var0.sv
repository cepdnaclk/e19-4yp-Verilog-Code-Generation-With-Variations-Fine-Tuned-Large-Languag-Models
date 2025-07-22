module example4(x1, x2, x3, x4, f, g, h);
input x1, x2, x3, x4;
output f, g, h;
wire w1;
assign w1 = x1 | x3;
assign h = (x2 | x4) & w1;
assign g = (x1 & x3) | (x2 & x4);
assign f = g | h;
endmodule