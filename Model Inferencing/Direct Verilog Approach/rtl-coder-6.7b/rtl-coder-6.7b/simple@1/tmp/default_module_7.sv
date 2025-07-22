module AndOr (output X, Y, input bit A, B, C);
assign #10 X = A & B;
assign #10 Y = B | C;
endmodule