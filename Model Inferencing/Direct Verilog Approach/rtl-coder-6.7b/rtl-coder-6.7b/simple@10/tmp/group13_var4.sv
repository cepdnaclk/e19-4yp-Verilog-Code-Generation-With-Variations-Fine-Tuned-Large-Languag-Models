module Half_Adder(
    input logic A, B,
    output logic [7:0] Sum, Carry
);
    assign Sum = {4'b0, A ^ B};
    assign Carry = {3'b0, A & B};
endmodule

###