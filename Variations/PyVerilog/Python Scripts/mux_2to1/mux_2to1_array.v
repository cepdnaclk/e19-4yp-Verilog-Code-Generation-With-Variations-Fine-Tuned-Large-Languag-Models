
module mux_2to1_array
(
  input [3:0] A,
  input [3:0] B,
  input SEL,
  output [3:0] Y
);

  assign Y = (SEL)? A : B;

endmodule
