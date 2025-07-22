

module sub_mux
(
  input A,
  input B,
  input SEL,
  output Z
);

  assign Z = (SEL)? A : B;

endmodule



module mux_2to1_xmr
(
  input A,
  input B,
  input SEL,
  output Y
);

  wire Z;

  sub_mux
  inst
  (
    .A(A),
    .B(B),
    .SEL(SEL),
    .Z(Z)
  );

  assign Y = Z;

endmodule

