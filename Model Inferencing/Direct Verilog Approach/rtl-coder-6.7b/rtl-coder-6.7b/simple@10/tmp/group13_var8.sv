module Full_Adder_8bit(
    input logic [7:0] A, B,
    output logic [7:0] Sum,
    output logic Carry
);
    logic Carry_1, Carry_2, Carry_3, Carry_4, Carry_5, Carry_6, Carry_7;
    Half_Adder half_adder_0(.A(A[0]),.B(B[0]),.Sum(Sum[0]),.Carry(Carry_1));
    Half_Adder half_adder_1(.A(A[1]),.B(B[1]),.Sum(Sum[1]),.Carry(Carry_2));
    Full_Adder half_adder_2(.A(A[2]),.B(B[2]),.Sum(Sum[2]),.Carry(Carry_3),.Carry_in(Carry_1));
    Full_Adder half_adder_3(.A(A[3]),.B(B[3]),.Sum(Sum[3]),.Carry(Carry_4),.Carry_in(Carry_2));
    Full_Adder half_adder_4(.A(A[4]),.B(B[4]),.Sum(Sum[4]),.Carry(Carry_5),.Carry_in(Carry_3));
    Full_Adder half_adder_5(.A(A[5]),.B(B[5]),.Sum(Sum[5]),.Carry(Carry_6),.Carry_in(Carry_4));
    Full_Adder half_adder_6(.A(A[6]),.B(B[6]),.Sum(Sum[6]),.Carry(Carry_7),.Carry_in(Carry_5));
    Full_Adder half_adder_7(.A(A[7]),.B(B[7]),.Sum(Sum[7]),.Carry(Carry),.Carry_in(Carry_6));
endmodule