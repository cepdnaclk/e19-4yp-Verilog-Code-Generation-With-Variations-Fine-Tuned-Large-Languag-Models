`timescale 1ns/100ps
module ALU8 (input [7:0] left, right, input [1:0] mode, output [7:0] ALUout);
wire [7:0] ALUout_temp;

assign ALUout_temp = (mode == 0)? left + right
             : (mode == 1)? left - right
             : (mode == 2)? left & right
             : (mode == 3)? left | right
             : 8'bX;
endmodule