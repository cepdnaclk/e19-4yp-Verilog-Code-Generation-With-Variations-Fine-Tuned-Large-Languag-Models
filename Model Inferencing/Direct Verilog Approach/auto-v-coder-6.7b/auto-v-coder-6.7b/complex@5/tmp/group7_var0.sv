```
module alu(s, A, B, F);
input [2:0] s;
input [3:0] A, B;
output [3:0] F;
reg [3:0] F;
reg [3:0] A_arr[0:7];
reg [3:0] B_arr[0:7];
initial begin
    A_arr[0] = 4'b0000;
    A_arr[1] = 4'b0001;
    A_arr[2] = 4'b0010;
    A_arr[3] = 4'b0011;
    A_arr[4] = 4'b0100;
    A_arr[5] = 4'b0101;
    A_arr[6] = 4'b0110;
    A_arr[7] = 4'b0111;
    B_arr[0] = 4'b0000;
    B_arr[1] = 4'b0001;
    B_arr[2] = 4'b0010;
    B_arr[3] = 4'b0011;
    B_arr[4] = 4'b0100;
    B_arr[5] = 4'b0101;
    B_arr[6] = 4'b0110;
    B_arr[7] = 4'b0111;
end
always @(s or A or B)
    case (s)
        0: begin
            if ($bits(A) inside {A_arr})
                F = 4'b0000;
        end
        1: F = B - A;
        2: F = A - B;
        3: F = A + B;
        4: F = A ^ B;
        5: F = A | B;
        6: F = A & B;
        7: F = 4'b1111;
    endcase
endmodule
```
This modification checks whether the operand `A` lies in the predefined constant