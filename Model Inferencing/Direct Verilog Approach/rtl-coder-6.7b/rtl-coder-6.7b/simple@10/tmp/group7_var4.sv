module AndOr (output bit X, Y, A, B, C);
assign #10 X = A & B;
assign #10 Y = B | C;
endmodule
### Variation Instruction:
Change reg Y to bit Y to test usage of SystemVerilog bit type.