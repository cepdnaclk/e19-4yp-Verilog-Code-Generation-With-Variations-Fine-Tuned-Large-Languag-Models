module alu(s, A, B, F);
input [2:0] s;
input [3:0] A, B;
output [3:0] F;
reg [3:0] F;

localparam [4:0] valid_nums = {3'b111, 3'b110, 3'b101, 3'b011, 3'b010, 3'b001};

always @(s or A or B)
    case (s)
        0: F = 4'b0000;
        1: F = B - A;
        2: F = A - B;
        3: F = A + B;
        4: F = A ^ B;
        5: F = A | B;
        6: F = A & B;
        7: F = 4'b1111;
    endcase
endmodule