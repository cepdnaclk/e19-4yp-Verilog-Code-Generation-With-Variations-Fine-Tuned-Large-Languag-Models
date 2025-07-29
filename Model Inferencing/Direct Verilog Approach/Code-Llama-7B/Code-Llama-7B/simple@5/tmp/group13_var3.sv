// Verilog code for Problem 8
module Full_Adder(
    input A, B, Cin,
    output logic [7:0] Sum, Carry
);
    logic S1, S2;
    Half_Adder HA1(.A(A),.B(B),.Carry(S1),.Sum(Carry));
 
    Half_Adder HA2(.A(S1),.B(Cin),.Carry(S2),.Sum());
endmodule
###
module Half_Adder_4_bit(
    input A, B,
    output sum, carry
);
    wire S1, C4;
    Full_Adder FA1(.A(A[0]),.B(B[0]),.Cin(1'b0),.Sum(C4