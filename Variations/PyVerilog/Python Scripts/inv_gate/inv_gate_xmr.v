

module sub_inv
(
  input A,
  output Z
);

  assign Z = ~A;

endmodule



module inv_gate_xmr
(
  input A,
  output Y
);

  wire Z;

  sub_inv
  inst
  (
    .A(A),
    .Z(Z)
  );

  assign Y = Z;

endmodule

