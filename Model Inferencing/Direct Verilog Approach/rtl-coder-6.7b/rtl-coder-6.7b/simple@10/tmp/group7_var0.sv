module AndOr (output X, Y, input reg A, B, C);
assign #10 X = A & B;
assign #10 Y = B | C;
endmodule
###