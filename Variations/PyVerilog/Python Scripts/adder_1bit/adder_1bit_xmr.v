

module sub_adder
(
  input A,
  input B,
  input CIN,
  output Z
);

  assign Z = A ^ B ^ CIN;

endmodule



module adder_1bit_xmr
(
  input A,
  input B,
  input CIN,
  output SUM
);

  wire Z;

  sub_adder
  inst
  (
    .A(A),
    .B(B),
    .CIN(CIN),
    .Z(Z)
  );

  assign SUM = Z;

endmodule

