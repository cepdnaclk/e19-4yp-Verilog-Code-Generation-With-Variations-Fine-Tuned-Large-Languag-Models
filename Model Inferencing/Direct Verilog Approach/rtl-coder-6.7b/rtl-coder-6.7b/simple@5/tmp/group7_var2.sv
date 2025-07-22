module AndOr (output X, Y, input bit A, B, C);
assign #10 X = A & B;
assign #10 Y = B | C;
endmodule
### Testbench:
module tb();
reg A,B,C;
wire X,Y;
AndOr andor(.A(A),.B(B),.C(C),.X(X),.Y(Y));
initial
begin
$monitor("%t: A=%b B=%b C=%b X=%b Y=%b", $time, A, B, C, X, Y);
A = 1'b0; B = 1'b0; C = 1'b0;
#30 A = 1'b1; B = 1'b1; C = 1'b1;
#100 $finish;
end
endmodule