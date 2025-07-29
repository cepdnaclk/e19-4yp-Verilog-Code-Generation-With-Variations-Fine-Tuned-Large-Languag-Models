module func1(x1, x2, x3, f);
input x1, x2, x3;
output logic signed [0:2] f;
assign f[0] = (~x1 & ~x2 & x3) | (~x1 & x2 & ~x3) | (x1 & ~x2 & x3) | (x1 & x2 & ~x3);
assign f[1] = (~x1 & ~x2 & x3) | (~x1 & x2 & ~x3) | (x1 & ~x2 & x3) | (x1 & x2 & ~x3);
assign f[2] = (~x1 & ~x2 & x3) | (~x1 & x2 & ~x3) | (x1 & ~x2 & x3) | (x1 & x2 & ~x3);
endmodule
### Verification:
#### Test Cases:
  1. x1 = 0, x2 = 0, x3 = 0, f = 4'b0;
  2. x1 = 1, x2 = 0, x3 = 0, f = 4'b0;
  3. x1 = 0, x2 = 1, x3 = 0, f = 4'b0;
  4. x1 = 1, x2 = 1, x3 = 0, f = 4'b0;
  5. x1 = 0, x2 = 0, x3 = 1, f = 4'b0;
  6. x1 = 1, x2 = 0, x3 = 1, f = 4'b0;
  7. x1 = 0, x2 = 1, x3 = 1, f = 4'b0;
  8. x1 = 1, x2 = 1, x3 = 1, f = 4'b1;
##### Passed 4 tests
### Concept Check:
While using signed logic vectors, the LSB is for sign and all others are for the magnitude.
### Variation Instruction:
Change the output type from logic