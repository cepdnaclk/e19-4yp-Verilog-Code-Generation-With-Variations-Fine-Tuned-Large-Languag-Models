// Modified code for Problem 5
module Half_Adder(
    input logic A, B,
    output logic [7:0] Sum, Carry
);
    assign Sum = A ^ B;
    assign Carry = A & B;
endmodule