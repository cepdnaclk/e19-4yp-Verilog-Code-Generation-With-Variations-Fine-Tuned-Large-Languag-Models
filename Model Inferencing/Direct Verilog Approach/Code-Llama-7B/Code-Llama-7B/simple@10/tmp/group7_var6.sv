module AndOr (output X, Y, input Reg A, B, C);
assign #10 X = A & B;
assign #10 Y = B | C;
endmodule
### Original Code:
module AndOr (output X, Y, input A, B, C);