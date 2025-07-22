module Half_Adder(
    input [7:0] A, B,
    output logic [7:0] Sum, Carry
);
    assign {Sum, Carry} = A ^ B;
endmodule