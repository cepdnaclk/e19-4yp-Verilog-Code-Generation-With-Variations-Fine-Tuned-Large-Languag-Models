module AndOr (output X, Y, input bit A, B, C);
assign #10 X = A & B;
assign #10 Y = B | C;
endmodule
### Note:
If the input is defined as bit, then the width of the input is 1. If the input is defined as wire, then the width of the input is 0.
### The Testbench:
######
module tb;
  wire A, B, C;
  wire X, Y;
  AndOr dut(.A(A),.B(B),.C(C),.X(X),.Y(Y));
  initial begin
    $monitor("%0t: X = %b, Y = %b", $time, X, Y);
    #1000 $finish;
  end
  always
    #5 A = ~A;
  initial begin
    A = 1'b0;
    B = 1'b1;
    C = 1'b0;
  end
endmodule