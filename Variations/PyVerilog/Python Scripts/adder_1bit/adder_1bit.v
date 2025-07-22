
module adder_1bit
(
  input A,
  input B,
  input CIN,
  output SUM
);

  assign SUM = A ^ B ^ CIN;

endmodule
