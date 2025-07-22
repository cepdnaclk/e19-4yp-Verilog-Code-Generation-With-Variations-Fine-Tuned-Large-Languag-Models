
module adder_1bit_compare
(
  input [7:0] A,
  output SUM
);

  reg [7:0] values [3:0];
  reg SUM;

  initial begin
    values[0] = 100;
    values[1] = 110;
    values[2] = 120;
    values[3] = 130;
    SUM = (A == values[0]) || (A == values[1]) || (A == values[2]) || (A == values[3]);
  end


endmodule
