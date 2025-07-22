

module sub_nand
(
  input A,
  input B,
  output Z
);

  assign Z = ~(A & B);

endmodule



module nand_gate_xmr
(
  input A,
  input B,
  output Y
);

  wire Z;

  sub_nand
  inst
  (
    .A(A),
    .B(B),
    .Z(Z)
  );

  assign Y = Z;

endmodule

