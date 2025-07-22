```
module alu(s, A, B, F);
input [2:0] s;
input [3:0] A, B;
output [3:0] F;
reg [3:0] F;

localparam NUM_OPS = 8;
localparam NUM_BITS = 4;

reg [NUM_BITS-1:0] op_array [NUM_OPS-1:0] = '{ 4'b0000, 4'b0000, 4'b0000, 4'b0000, 4'b0000, 4'b0000, 4'b0000, 4'b1111 };

always @(s or A or B)
    case (s)
        0: F = op_array[s];
        1: begin
            F = B - A;
            if (s inside {[1:3]})
                F = 4'b0000;
            F = op_array[s];
        end
        2: begin
            F = A - B;
            if (s inside {[1:3]})
                F = 4'b0000;
            F = op_array[s];
        end
        3: begin
            F = A + B;
            if (s inside {[1:3]})
                F = 4'b0000;
            F = op_array[s];
        end
        4: begin
            F = A ^ B;
            if (s inside {[1:3]})
                F = 4'b0000;
            F = op_array[s];
        end
        5: begin
            F = A | B;
            if (s inside {[1:3]})
                F = 4'b0000;
            F = op_array[s];
        end
        6: begin
            F = A & B;
            if (s inside {[1:3]})
                F = 4'b0000;
            F = op_array[s];
        end