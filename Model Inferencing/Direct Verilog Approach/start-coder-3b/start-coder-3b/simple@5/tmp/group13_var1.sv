// Verilog code for Problem 13
module Full_Adder(
    input logic [7:0] Sum, CarryIn,
    output logic [7:0] Sum, CarryOut
);
    wire [7:0] Sum, Carry;
    Half_Adder_180 Half1(
       .A(Sum),.B(CarryIn),
       .Sum(Carry),.Carry(Sum)