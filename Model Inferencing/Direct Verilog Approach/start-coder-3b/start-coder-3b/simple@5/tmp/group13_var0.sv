// Verilog code for Problem 8
module ALU(
    input logic [7:0] A, B,
    input [2:0] C,
    output logic [7:0] ALU_Result, ALU_Carry
);
    integer i;
    logic [7:0] ALU_Result;
    logic ALU_Carry;
    assign ALU_Carry = 1'b0;
    always @ (negedge C) begin
        if (C == 0) begin
            ALU_Result <= {{2{A}}, B};
        end
        else if (C == 1) begin
            ALU_Result <= {{2{B}}, A};
        end
        else if (C == 2) begin
            ALU_Result <= {A, B};
        end
        else if (C == 3) begin
            ALU_Result <= {B, A};
        end
        else if (C == 4) begin
            ALU