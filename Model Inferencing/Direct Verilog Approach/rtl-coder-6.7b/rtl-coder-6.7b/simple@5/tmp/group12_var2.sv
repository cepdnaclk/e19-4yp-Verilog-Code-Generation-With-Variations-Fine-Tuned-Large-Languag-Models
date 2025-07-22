module Problem1(input [3:0] a, b, output [3:0] sum);
  logic di, clk; // <---
  problem1 dut1(
   .a(a),
   .b(b),
   .sum(sum),
   .ci(di),
   .clk(clk)
  );
endmodule