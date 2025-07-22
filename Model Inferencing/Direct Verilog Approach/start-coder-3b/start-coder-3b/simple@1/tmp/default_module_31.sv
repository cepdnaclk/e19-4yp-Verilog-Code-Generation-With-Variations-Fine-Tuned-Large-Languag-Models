module func4(x1, x2, x3, x4, f);
input x1, x2, x3, x4;
output logic signed f;
assign f = (x1 & x2 & ~x3 & ~x4) | (~x1 & ~x2 & x3 & ~x4) | (x1 & ~x2 & ~x3 & x4) | (~x1 & x2 & x3 & x4);
endmodule
### Test Verilog:
module TestFunc4(
  input x1, x2, x3, x4, f
);
input x1, x2, x3, x4;
output f;
func4 myfunc4(x1, x2, x3, x4);
assign f = myfunc4(x1, x2, x3, x4);
endmodule
### Testbench:
module TestFunc4_tb(
  input clk,
  input rst,
  input x1, x2, x3, x4, f
);
logic [3:0] x1, x2, x3, x4;
logic f;
func4 myfunc4 (x1, x2, x3, x4, f);
initial begin
x1 = 8'h0101;
x2 = 8'h1010;
x3 = 8'h1001;
x4 = 8'h0010;
#5 rst = 1;
#5 rst = 0;
$monitor(1'b1);
$monitor