module AndOr (output X, Y, input bit A, B, C);
assign #10 X = A & B;
assign #10 Y = B | C;
endmodule
### The following is the SystemVerilog code (with the bit as inputs).
module AndOr (output X, Y, input bit A, B, C);
assign #10 X = A & B;
assign #10 Y = B | C;
endmodule
### Notice that all the times are the same as the base module example.