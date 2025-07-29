module Problem1(input [3:0] a, b, output [3:0] sum);
  logic [3:0] di, clk;
  assign di = a + b;
  assign clk = di;
  logic [3:0] sum;
  always_ff @(posedge di) begin
    sum <= clk;