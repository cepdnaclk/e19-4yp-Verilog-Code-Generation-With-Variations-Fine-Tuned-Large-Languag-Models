module example4(x1, x2, x3, x4, f, g, h);
input x1, x2, x3, x4;
output f, g, h;
rand logic rg;
rand logic rh;
rand logic rg1;
assign #1 rg = (x1 & x3) | (x2 & x4);
assign #1 rg1 = (x1 | x3) & (x2 | x4);
assign #1 rh = rg | rg1;
assign g = rg;
assign h = rh;
assign f = rh;
endmodule