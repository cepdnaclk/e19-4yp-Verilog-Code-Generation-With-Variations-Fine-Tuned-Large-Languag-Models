module example5(x1, x2, x3, f);
input x1, x2, x3;
output f;
reg f;
always @(x1 or x2 or x3)
    if (x2 == 1)
        f = x1;
    else if (x2 == 1'b111 || x2 == 1'b11 || x2 == 1'b10 || x2 == 1'b0)
        f = x3;
endmodule
### Synthesizer Output File:
module example5(x1, x2, x3, f);
input x1, x2, x3;
output f;
reg f;
always @(x1 or x2 or x3)
    if (x1)
        f = 1;
    else if (x2 == 1'b111 || x2 == 1'b11 || x2 == 1'b10 || x2 == 1'b0)
        f = x3;
endmodule