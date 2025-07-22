module Half_Adder(
  input logic [7:0] A, B,
  output logic [7:0] Sum, Carry
);
  assign Sum = A ^ B;
  assign Carry = A & B;
endmodule