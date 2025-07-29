module example9(x1, x2, x3, f);
input x1, x2, x3;
output f;
reg[3:0] g;
reg[3:0] q;
assign f = q[3:0] == g[3:0];
always @(x3)
    q <= g;
endmodule
### Original Design:
module example10(x1, x2, x3, f);
input x1