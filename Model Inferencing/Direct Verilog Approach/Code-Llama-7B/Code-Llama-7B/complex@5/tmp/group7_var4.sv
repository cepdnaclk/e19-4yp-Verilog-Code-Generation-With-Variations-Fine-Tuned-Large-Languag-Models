module alu(s, A, B, F);
input [2:0] s;
input [3:0] A, B;
output [3:0] F;
reg [3:0] F;
reg [3:0] A_inside;
assign A_inside = A[s];
always @(s or A_inside or B)
    case (s)
        0: F = 4'b0000;
        1: F = B - A_inside;
        2: F = A_inside - B;
        3: F = A_inside + B;
        4: F = A_inside ^ B;
        5: F = A_inside | B;
        6: F = A_inside & B;
        7: F = 4'b1111;
    endcase
endmodule
### Screenshot of the Output:
<img width="1792" alt="Screenshot 2022-