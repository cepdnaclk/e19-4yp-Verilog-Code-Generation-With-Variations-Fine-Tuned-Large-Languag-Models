module func1(signed x1, signed x2, signed x3, signed f);
input signed x1, x2, x3;
output signed f;
assign f = (~x1 & ~x2 & x3) | (~x1 & x2 & ~x3) | (x1 & ~x2 & x3) | (x1 & x2 & ~x3);
endmodule
### Test Case:
Change the inputs from 000 to 001 to test the case in which one input changes.
### Base Output:
F=0
### Modified Output:
(X1, X2, X3, F)
0001, 0000, 0000, 0
0010, 0000, 0000, 0
0100, 0000, 0000, 0
1000, 0000, 0000, 0
0001, 0001, 0000, 0
0010, 0001, 0000, 0
0100, 0001, 0000, 0
1000, 0001, 0000, 0
0001, 0010, 0000, 0
0010, 0010, 0000, 0
0100, 0010, 0000, 0
1000, 0010, 0000, 0
0001, 0100, 0000, 0
0010, 0100, 0000, 0
0100, 0100, 0000, 0
1000, 0100, 0000, 0
0001, 1000, 0000, 0
0010, 1000, 0000, 0
0