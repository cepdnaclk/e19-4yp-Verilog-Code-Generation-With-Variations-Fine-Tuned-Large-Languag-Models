module netdelay1(clk, x, y);
input clk, x;
output y;
wire #(0,0) _x, _y;
clk_gate(clk,x,