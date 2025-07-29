module test;
wire a;
reg[2:0] x;
reg[2:0] y;
reg[2:0] z;
assign #25 a = 1;
always begin
    x = #10 a;