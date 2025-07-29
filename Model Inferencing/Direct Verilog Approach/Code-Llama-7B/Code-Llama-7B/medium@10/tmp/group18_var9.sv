`timescale 1ns/100ps
module maj3_p (input a, b, c, output y);
wire im1, im2, im3;
parameter
    tplh1=2, tphl1=4,
    tplh2=3, tphl2=5;
function [2:0] f;
    input [1:0] x;
    begin
        case (x)
            2'b00: f=3'b000;
            2'b01: f=3'b001;
            2'b10: f=3'b100;
            2'b11: f=3'b010;
        endcase
    end
endfunction
always @*
    begin
        im1=a&b;
        im2