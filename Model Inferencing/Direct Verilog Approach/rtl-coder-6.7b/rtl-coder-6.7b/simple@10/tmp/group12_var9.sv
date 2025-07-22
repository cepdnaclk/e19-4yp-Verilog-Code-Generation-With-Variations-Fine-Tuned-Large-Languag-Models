module reg_problem(input [3:0] a, b, output [3:0] sum);
  logic di, clk;
  parameter p = 123;
  reg Problem1(.a(a),.b(b),.sum(sum));
endmodule