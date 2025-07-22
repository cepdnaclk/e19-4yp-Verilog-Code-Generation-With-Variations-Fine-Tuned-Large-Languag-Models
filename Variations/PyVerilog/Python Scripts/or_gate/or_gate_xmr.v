

module sub_or
(
  input A,
  input B,
  output Z
);

  assign Z = A | B;

endmodule



module or_gate_xmr
(
  input A,
  input B,
  output Y
);

  wire Z;

  sub_or
  inst
  (
    .A(A),
    .B(B),
    .Z(Z)
  );

  assign Y = Z | A;

endmodule

