module top(input clk, input rst, input [1:0] sel, output reg [3:0] q, input [3:0] d);
  reg [3:0] X[2:0];
  reg Y;
  initial begin
    $display("... verifying packed array slices...");
    X[0] = 4'b1010;
    X[1] = 4'b0101;
    X[2] = 4'b0010;
    Y = 1'b0;
  end
  always @(posedge clk or posedge rst) begin
    if (rst) begin
      q <= 4'b0;
      $display("rst");
    end else begin
      $display("sel = %b", sel);
      if (sel[0] == 1'b1)
        q <= X[2];
      else if (sel[1] == 1'b1)
        q <= X[1];
      else if (sel[1] ==