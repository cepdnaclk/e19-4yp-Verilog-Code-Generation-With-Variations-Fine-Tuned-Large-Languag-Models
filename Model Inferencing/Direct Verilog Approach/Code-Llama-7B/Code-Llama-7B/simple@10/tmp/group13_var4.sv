// Verilog code for Problem 5
module Half_Adder(
    input logic A, B,
    output logic [7:0] Sum, Carry
);
    assign Sum = A ^ B;
    assign Carry = A & B;
endmodule

module Full_Adder(
    input logic A, B, Cin,
    output logic Cout, S
);
    logic [7:0] x, y;
    Half_Adder half_1