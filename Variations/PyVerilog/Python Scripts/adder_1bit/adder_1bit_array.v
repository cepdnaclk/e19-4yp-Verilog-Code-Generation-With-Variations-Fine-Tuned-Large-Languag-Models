
module adder_1bit_array
(
  input [3:0] A,
  input [3:0] B,
  input CIN,
  output [3:0] SUM
);

  assign SUM = A ^ B ^ CIN;

endmodule
