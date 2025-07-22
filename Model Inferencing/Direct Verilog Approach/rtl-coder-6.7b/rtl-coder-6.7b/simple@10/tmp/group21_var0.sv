module example4(x1, x2, x3, x4, f, g, h);
input x1, x2, x3, x4;
output f, g, h;
reg g, h;
assign g = (x1 & x3) | (x2 & x4);
assign h = (x1 | x3) & (x2 | x4);
assign f = g | h;
endmodule
### Variation Summary:
Replace the wait(c) statement with a blocking assignment inside a structure containing rand members