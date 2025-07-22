

module sub_and
(
  input A,
  input B,
  output Z
);

  assign Z = A & B;

endmodule



module and_gate_xmr
(
  input A,
  input B,
  output Y
);

  wire Z;

  sub_and
  inst
  (
    .A(A),
    .B(B),
    .Z(Z)
  );

  assign Y = Z & A;

endmodule

