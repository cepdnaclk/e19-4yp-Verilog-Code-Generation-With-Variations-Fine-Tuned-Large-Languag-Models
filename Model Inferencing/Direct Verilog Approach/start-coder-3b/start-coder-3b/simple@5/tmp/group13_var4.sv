// Verilog code for Problem 11.1
module Full_Adder(
    input logic A, logic B, logic Cin,
    output logic [15:0] Sum, output logic Cout
);
    assign Sum = A ^ B ^ Cin;
    assign Cout = (A&B) | (A&Cin