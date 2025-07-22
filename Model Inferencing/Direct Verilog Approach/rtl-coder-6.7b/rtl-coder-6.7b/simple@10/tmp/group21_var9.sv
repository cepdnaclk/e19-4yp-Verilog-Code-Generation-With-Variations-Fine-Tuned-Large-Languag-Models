module example4(x1, x2, x3, x4, f, g, h);
input x1, x2, x3, x4;
output f, g, h;
assign #10 g = (x1 & x3) | (x2 & x4);
assign #10 h = (x