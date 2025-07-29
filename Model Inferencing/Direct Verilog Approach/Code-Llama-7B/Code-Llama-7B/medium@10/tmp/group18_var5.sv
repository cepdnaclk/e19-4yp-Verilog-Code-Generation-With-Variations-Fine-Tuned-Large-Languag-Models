`timescale 1ns/100ps
module maj3_d (input a, b, c, output y);
wire z;
always@(a, b, c)
    z=maj(a,b,c)[0];
assign y=z;
endmodule
`
### Original Code