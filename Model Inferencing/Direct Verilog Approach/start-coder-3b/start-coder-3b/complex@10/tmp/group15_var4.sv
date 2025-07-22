module updcounter(input a, input clk, output reg[3:0] N, output reg u_d);
reg[3:0]N;
reg[3:0]D; //changed from u_d
reg clock_reset;
wire [3:0]a;