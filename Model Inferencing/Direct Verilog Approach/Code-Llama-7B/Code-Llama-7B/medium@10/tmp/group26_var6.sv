module example5_1(x1, x2, x3, f);
input x1, x2, x3;
output f;
reg f;
wire [7:0] arr_1 = 8'h00;
wire [7:0] arr_2 = 8'hF0;
wire [7:0] arr_3 = 8'h93;
always @(x1 or x2 or x3)
    if (x2 == 1)
        f = x1;
    else
        f = x3;
    if (arr_1[2: