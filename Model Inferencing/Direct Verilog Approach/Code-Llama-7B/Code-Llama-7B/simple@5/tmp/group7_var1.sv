module AndOr (output X, Y, input bit A, B, C);
assign #10 X = A & B;
assign #10 Y = B | C;
endmodule
### Testbench Code:
module AndOr_Testbench;
wire X, Y;
bit A, B, C;
AndOr DUT (.X(X),.Y(Y),.A(A),.B(B),.C(C));
initial begin
X = 0; Y = 0; A = 1; B = 1; C = 1;
### Variation:
C = 0;
###
end
endmodule
### Expected output (simulation):
X = 1, Y = 1
### Actual output (simulation):
X = 1, Y = 0
### Failed tests:
1
### Passed tests:
0
### Total tests:
1
### Configured Simulation Time:
-1 ps
### CLOCK_PERIOD:
100.0 ns
###