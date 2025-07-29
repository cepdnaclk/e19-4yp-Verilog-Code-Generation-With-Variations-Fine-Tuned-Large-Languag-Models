module AndOr (output X, Y, input [1:0] A, [1:0] B, [1:0] C, output [1:0] Z);
assign #10 {X, Z} = A & B;
assign #10 Y = B | C;
endmodule
### Screens