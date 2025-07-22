module example5(x1, x2, x3, f);
input [1:0]x1;
input [1:0]x2;
input [1:0]x3;
output [1:0]x4;
reg [1:0]x4;
always @(x1 or x2 or x3)
    if (x2 == 1)
        f[0] = x1[0];
    else
        f[0] = x3[0];
endmodule