// Full_Adder.v
// Verilog code for Problem 11
module Full_Adder(
    input logic [7:0] A, B, logic Cin,
    output logic [7:0] Sum, logic Cout
);
    Half_Adder HA