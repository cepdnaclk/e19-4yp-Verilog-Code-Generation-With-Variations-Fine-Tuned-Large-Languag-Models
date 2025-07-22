
module inv_gate_param #
(
  parameter WIDTH = 8
)
(
  input [WIDTH-1:0] A,
  output [WIDTH-1:0] Y
);

  assign Y = ~A;

endmodule
