
module inside_var3
(
  input [7:0] A,
  output X
);

  reg [7:0] values [1:-2];
  reg X;

  initial begin
    values[-2] = 80;
    values[-1] = 90;
    values[0] = 100;
    values[1] = 110;
  end

  assign X = (A == values[-2]) || (A == values[-1]) || (A == values[0]) || (A == values[1]);

endmodule
