

module sub_xor
(
  input A,
  input B,
  output Z
);

  assign Z = A ^ B;

endmodule



module xor_gate_xmr
(
  input A,
  input B,
  output Y
);

  wire Z;

  sub_xor
  inst
  (
    .A(A),
    .B(B),
    .Z(Z)
  );

  assign Y = Z;

endmodule

