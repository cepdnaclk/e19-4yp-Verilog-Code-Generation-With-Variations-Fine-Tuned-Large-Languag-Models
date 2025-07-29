module mux( input [1:0] in, input clk, sel, output reg [1:0] out);
reg [1:0] int_o