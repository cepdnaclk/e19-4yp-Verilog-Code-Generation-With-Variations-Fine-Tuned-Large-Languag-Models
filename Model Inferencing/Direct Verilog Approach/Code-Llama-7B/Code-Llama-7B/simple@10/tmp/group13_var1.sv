module Half_Adder(
    input A, B,
    output logic [7:0] Sum, Carry
);
    logic [7:0] A_Extended;
    logic [7:0] B_Extended;