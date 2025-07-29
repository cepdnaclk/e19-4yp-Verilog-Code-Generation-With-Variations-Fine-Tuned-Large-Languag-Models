// Verilog code for Problem 10
module Full_Adder(
    input A, B, Cin,
    output logic [7:0] S, cout
);
    parameter C_SIZE = 1;