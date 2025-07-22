
module xor_gate_param #
(
  parameter WIDTH = 8
)
(
  input [WIDTH-1:0] A,
  input [WIDTH-1:0] B,
  output [WIDTH-1:0] Y
);

  assign Y = A ^ B;

endmodule
