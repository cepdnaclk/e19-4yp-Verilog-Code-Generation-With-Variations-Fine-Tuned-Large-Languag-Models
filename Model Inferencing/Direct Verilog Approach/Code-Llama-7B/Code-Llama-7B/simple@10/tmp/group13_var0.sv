module Full_Adder(
    input A, B, Cin,
    output logic Sum, Carry
);
    wire S1;
    Half_Adder h1 (
       .A (A),.B (B),.Sum (S1),.Carry ()
    );
    wire S2;
    Half_Adder h2 (
       .A (S