module AndOr (output X, Y, input A, B, C);
assign #(0) X = A & B;
assign #(0) Y = B | C;
endmodule
### Resulting Behavior:

### Notes:
This issue was resolved as part of https://github.com/SymbiFlow/sv-tests/pull/143/files.