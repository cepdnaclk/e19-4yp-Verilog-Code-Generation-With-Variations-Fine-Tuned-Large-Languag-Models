module Half_Adder(
    input A, B,
    output logic [7:0] Sum, Carry
);
    assign Sum = ~A ^ B;
    assign Carry = A & B;
endmodule
// Verilog code for Problem 6
module Full_Adder(
    input A, B, Carry_in,
    output logic [7:0] Sum, Carry_out
);
    wire Subtractor_out;
    Half_Adder HA_1(
       .A(A),.B(B),
       .Sum(Subtractor_out),
       .Carry(Carry_out)
    );
    xor #( 
       .I1_WIDTH(1), 
       .I2_WIDTH(1), 
       .O_