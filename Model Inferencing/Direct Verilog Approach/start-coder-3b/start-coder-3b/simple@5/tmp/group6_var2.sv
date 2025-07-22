module Bin_to_Hex ( input [7:0] bin, output [3:0] hex );
// Simple Bin to Hex converter
always @(bin)
case (bin)
16'h0000: hex = 16'h0;
16'h0001: hex = 16'h1;
16'h0010: hex = 16'h2;
16'h0011: hex = 16'h3;
16'h0100: hex = 16'h4;
16'h0101: hex = 16'h5;
16'h0110: hex = 16'h6;
16'h0111: hex = 16'h7;
16'h