module Problem1(input [3:0] a, b, output [3:0] sum);
  logic di;
  logic clk;
  reg [3:0] sum;
  always @ (posedge clk) begin
    sum <= di + b;
  end
endmodule