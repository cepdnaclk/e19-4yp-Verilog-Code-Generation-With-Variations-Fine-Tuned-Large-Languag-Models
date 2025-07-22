module AndOr (output bit X, Y, input A, B, C);
assign #10 X = A & B;
assign #10 Y = B | C;
endmodule