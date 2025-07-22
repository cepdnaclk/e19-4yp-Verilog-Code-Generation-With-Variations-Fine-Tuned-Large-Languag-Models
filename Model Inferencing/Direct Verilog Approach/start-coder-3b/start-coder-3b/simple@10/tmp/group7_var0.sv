module AndOr (output X, Y, input A, B, C);
logic [1:0] X, Y;
assign #10 X = A << 3;
assign #1