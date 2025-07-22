module func1(x1, x2, x3, f);
input logic [2:0] x1, x2, x3;
output logic signed[2:0] f;
assign f = (~x1 & ~x2 & x3) | (~x1 & x2 & ~x3) | (x1 & ~x2 & x3) | (x1 & x2 & ~x3);
endmodule
### Test Case:
### Signed Logic Vectors
Test Case 1:
1 1 1
Test Case 2:
1 0 1
### Unsigned Logic Vectors
Test Case 1:
1 1 1
Test Case 2:
1 0 1