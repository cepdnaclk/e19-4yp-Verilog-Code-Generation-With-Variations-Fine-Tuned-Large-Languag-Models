module example12(x, f);
input [10:0] x;
output f;
wire f;
reg f;
always @(x[9] or x[8] or x[7] or x[6] or x[5] or x[4])
    for (i = 0; i < 5; i