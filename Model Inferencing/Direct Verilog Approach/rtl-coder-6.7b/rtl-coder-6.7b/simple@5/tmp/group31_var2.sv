module func1(x1, x2, x3, f);
input logic x1, x2, x3;
logic signed [0:0] f;
assign f = (~x1 & ~x2 & x3) | (~x1 & x2 & ~x3) | (x1 & ~x2 & x3) | (x1 & x2 & ~x3);
endmodule
### Testbench:
module test;
logic x1, x2, x3, f;
initial begin
x1 = 0; x2 = 0; x3 = 0;
#10 x1 = 0; x2 = 0; x3 = 1;
#10 x1 = 0; x2 = 1; x3 = 0;
#10 x1 = 0; x2 = 1; x3 = 1;
#10 x1 = 1; x2 = 0; x3 = 0;
#10 x1 = 1; x2 = 0; x3 = 1;
#10 x1 = 1; x2 = 1; x3 = 0;
#10 x1 = 1; x2 = 1; x3 = 1;
end
func1 u1(x1, x2, x3, f);
endmodule
### Output:
### NOTE: all tests with 0 output
### NOTE: all tests with -1 output
### NOTE: all tests with x output