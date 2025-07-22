module alu(s, A, B, F);
input [2:0] s;
input [3:0] A, B;
output [3:0] F;
reg [3:0] F;
wire [3:0] A_mod;
reg [3:0] const_range_array [0:10];
assign A_mod = A;
always @(s or A_mod or B or const_range_array)
    begin
        const_range_array [0] = 4'b0000;
        const_range_array [1] = 4'b0001;
        const_range_array [2] = 4'b0010;
        const_range_array [3] = 4'b0011;
        const_range_array [4] = 4'b0100;
        const_range_array [5] = 4'b0101;
        const_range_array [6] = 4'b0110;
        const_range_array [7] = 4'b0111;
        const_range_array [8] = 4'b1000;
        const_range_array [9] = 4'b1001;
        const_range_array [10] = 4'b1111;
    end
    case (s)
        0: F = const_range_array [0];
        1: F = B - A;
        2: F = A - B;
        3: F = A + B;
        4: F = A ^ B;
        5: F = A | B;
        6: F = A & B;
        7: F = const_range_array [10];
    endcase
endmodule