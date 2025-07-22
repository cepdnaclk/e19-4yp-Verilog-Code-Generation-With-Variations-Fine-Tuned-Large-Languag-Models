module Problem1(input [3:0] a, b, output [3:0] sum);
  logic di, clk;
  my_nadder adder(a, b, di, clk, sum);
endmodule