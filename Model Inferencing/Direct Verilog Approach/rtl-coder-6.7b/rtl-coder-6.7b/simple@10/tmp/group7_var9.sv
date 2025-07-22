module AndOr (output X, Y, input bit A, B, C);
assign #10 X = A & B;
assign #10 Y = B | C;
endmodule
### Results:
- The delay for the first gate is unchanged
- The delay for the second gate is now 10 ps
- The minimum simulation time is now 10 ps
- The delay for all three gates is 20 ps
- The delay for the first gate is now 20 ps
- The delay for the second gate is now 10 ps
- The minimum simulation time is now 20 ps
- The delay for all three gates is 30 ps
- The delay for both the first gate and the second gate is now 20 ps
- The minimum simulation time is now 20 ps
- The delay for all three gates is 30 ps
- The delay for the first gate is now 30 ps
- The delay for the second gate is now 20 ps
- The minimum simulation time is now 30 ps
- The delay for all three gates is 40 ps