module tb_rj(clk, rst, data, rdy, out, busy);
reg clk;
reg rst;
reg data;
wire rdy;
wire out;
wire busy;
register_jump rj1(clk, rst, data, rdy, out, busy);