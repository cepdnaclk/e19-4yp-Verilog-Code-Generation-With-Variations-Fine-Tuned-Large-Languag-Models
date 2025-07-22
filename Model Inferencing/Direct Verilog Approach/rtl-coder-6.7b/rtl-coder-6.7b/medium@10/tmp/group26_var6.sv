module example5(x1, x2, x3, f);
input [3:0] x1;
input [1:0] x2;
input [2:0] x3;
output f;
reg f;
always @(x1 or x2 or x3)
    if (x2 in {0,1,2})
        f = x1[1];
    else
        f = x3[0];
endmodule