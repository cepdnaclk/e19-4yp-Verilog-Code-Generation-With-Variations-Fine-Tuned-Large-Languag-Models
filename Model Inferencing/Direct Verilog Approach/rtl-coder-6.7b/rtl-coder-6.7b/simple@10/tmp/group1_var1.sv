// Verilog code for Problem 6
module Full_Adder(
    input A, B,
    input [1:0] Cin [0:3],
    output Y,
    output [1:0] Cout [0:3]
);
    generate
        for (genvar i = 0; i < 4; i = i + 1) begin
            assign Y = A ^ B ^ Cin[i];
            assign Cout[i] = (A & B) | (A & Cin[i]) | (B & Cin[i]);