
module adder_1bit_param #
(
  parameter WIDTH = 8
)
(
  input [WIDTH-1:0] A,
  input [WIDTH-1:0] B,
  input CIN,
  output [WIDTH-1:0] SUM
);

  assign SUM = A ^ B ^ CIN;

endmodule
