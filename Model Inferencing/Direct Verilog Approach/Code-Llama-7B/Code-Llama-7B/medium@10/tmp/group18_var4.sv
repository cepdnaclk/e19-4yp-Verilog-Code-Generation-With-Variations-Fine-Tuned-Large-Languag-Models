`timescale 1ns/100ps
module maj3_p (input a, b, c, output y);
wire im1, im2, im3;
parameter
    tplh1=2, tphl1=4,
    tplh2=3, tphl2=5;
and #(tplh1, tphl1)
    (im1, a, b),
    (im2, b, c),
    (im3, c, a);
or #(tplh2, tphl2) (y, im1, im2, im3);
endmodule



module test (input clk, output y);
wire x[3:0], y[3:0];

assign x[0] = 1;
assign x[1] = 0;
assign x[2] = 1;
assign x[3] = 1;

maj3_p