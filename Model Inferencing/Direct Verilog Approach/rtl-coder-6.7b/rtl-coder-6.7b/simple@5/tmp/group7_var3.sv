module AndOr (output X, Y, input A, B, C);
assign #10 X = A & B;
assign #10 Y = B | C;
assign #10 $display("A is %b, B is %b, C is %b, X is %b, Y is %b, Time is %d", A, B, C, X, Y, $time);
assign #10 $strobe("%t A is %b, B is %b, C is %b, X is %b, Y is %b", $time, A, B, C, X, Y);
endmodule
### Variation Instruction