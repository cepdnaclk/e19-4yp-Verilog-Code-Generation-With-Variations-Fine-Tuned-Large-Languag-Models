module AndOr (output X, Y, input bit A, B, C);
assign #10 X = A & B;
assign #10 Y = B | C;
endmodule
## Modified Code with Error:
module AndOr (output X, Y, input A, B, C);
assign #10 X = A & B;
assign #10 Y = B | C;
endmodule