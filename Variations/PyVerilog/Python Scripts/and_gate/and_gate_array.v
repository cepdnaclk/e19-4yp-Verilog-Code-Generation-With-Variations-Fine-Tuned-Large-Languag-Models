
module and_gate_array
(
  input [3:0] A,
  input [3:0] B,
  output [3:0] Y
);

  assign Y = A & B;

endmodule
