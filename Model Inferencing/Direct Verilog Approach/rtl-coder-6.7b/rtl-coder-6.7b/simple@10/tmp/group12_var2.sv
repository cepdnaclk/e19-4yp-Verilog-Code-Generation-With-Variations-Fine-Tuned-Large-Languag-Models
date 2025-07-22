module Problem1(input [3:0] a, b, output [3:0] sum);
  logic di;
  logic clk;
  logic [3:0] sum;
  always @(posedge clk) begin
    sum <= di;
  end
endmodule