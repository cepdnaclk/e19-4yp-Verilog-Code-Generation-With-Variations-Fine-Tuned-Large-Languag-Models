module alu(s, A, B, F);
input [2:0] s;
input [3:0] A, B;
output [3:0] F;
reg [3:0] F;
const_reg [3:0] constReg[3] = '{0, 2'h3, 3'hF};
always @(s or A or B) begin
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
    if ((A inside {constReg[0], constReg[1], constReg[2]})) begin
        F = A;
    end
end
endmodule