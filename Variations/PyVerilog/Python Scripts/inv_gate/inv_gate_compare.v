
module inv_gate_compare
(
  input [7:0] A,
  output Y
);

  reg [7:0] values [3:0];
  reg Y;

  initial begin
    values[0] = 100;
    values[1] = 110;
    values[2] = 120;
    values[3] = 130;
    Y = (A == values[0]) || (A == values[1]) || (A == values[2]) || (A == values[3]);
  end


endmodule
