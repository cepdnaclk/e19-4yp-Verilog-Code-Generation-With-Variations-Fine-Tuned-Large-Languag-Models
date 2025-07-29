`timescale 1ns/1ps

module Full_Adder_Modified(
    input A, B, Cin,
    output reg [7:0] Sum, Carry
);
    wire Cout, S1, S2;
    Half_Adder DUT1(.*);
    Half_Adder DUT2(.*);

    assign Cout = S1 ^ S2 ^ Cin;
    assign Carry = Cout;
    assign Sum = S1 ^ S2;
endmodule