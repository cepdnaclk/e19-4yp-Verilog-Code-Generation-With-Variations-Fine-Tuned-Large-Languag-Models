
module mux_2to1_param #
(
  parameter WIDTH = 8
)
(
  input [WIDTH-1:0] A,
  input [WIDTH-1:0] B,
  input SEL,
  output [WIDTH-1:0] Y
);

  assign Y = (SEL)? A : B;

endmodule
