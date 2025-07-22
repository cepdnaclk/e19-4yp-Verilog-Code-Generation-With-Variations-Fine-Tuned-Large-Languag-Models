module AndOr (output X, Y, input short A, B, C);
assign X = A & B;
assign Y = B | C;