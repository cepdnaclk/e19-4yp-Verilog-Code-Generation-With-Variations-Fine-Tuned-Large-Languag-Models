
module inside_var1
(
  input [7:0] A,
  output X
);

  reg [7:0] values [3:0];
  reg X;

  initial begin
    values[0] = 100;
    values[1] = 110;
    values[2] = 120;
    values[3] = 130;
  end

  begin
    X <= (A == values[0]) || (A == values[1]) || (A == values[2]) || (A == values[3]);
  end

endmodule
