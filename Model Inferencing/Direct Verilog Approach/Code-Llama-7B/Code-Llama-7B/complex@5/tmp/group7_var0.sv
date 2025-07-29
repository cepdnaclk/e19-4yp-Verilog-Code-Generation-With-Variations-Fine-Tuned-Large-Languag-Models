module alu2(s, A, B, F);
input [2:0] s;
input [3:0] A, B;
output [3:0] F;
reg [3:0] F;
wire [3:0] A2;
wire [3:0] A2_const;
reg [3:0] const_array[4] = {5, 6, 3, 4};
reg [7:0] i = 8'd0;
reg [7:0] iter = 8'd0;
always @ (posedge Clk) begin
    if (reset == 1'b0) begin
        iter <= 8'd0;
    end
    else if (iter < 4) begin
        i <= i + 1;
        if (s == const_array[i]) begin
            iter <= i + 1;
        end
        else begin
            iter <= 8'd0;
        end
    end
end
always @(s or A or B)
    case (s)
        0: begin
            F = 4'b0000;
        end
        1: begin
            A2 = A;
            A2_const = A[2:1];
            if (iter == 0) begin
                F = B - A2_const;
            end
            else begin
                F = 4'b1111;
            end
        end
        2: begin
            A2 = A;
            A2_const = A[2:1];
            if (iter == 1) begin
                F = A2_const - B;
            end
            else begin
                F = 4'b1111;
            end
        end
        3: begin
            A2 = A;
            A2_const = A[2:1];
            if (iter == 2) begin
                F = A2_const + B;
            end
            else begin
                F = 4'b1111;
            end
        end
        4: begin
            A2 = A;
            A2_const = A[2:1];
            if (iter == 3) begin
                F = A2_const ^ B;
            end
            else begin
                F = 4'b1111;
            end
        end
        5: begin
            A2 = A;
            A2_const = A[2:1];
            if (iter == 3) begin
                F = A2_const | B;
            end
            else begin
                F = 4'b1111;
            end
        end
        6: begin
            A2 = A;
            A2_const = A[2:1];
            if (iter == 3) begin
                F = A2_const & B;
            end
            else begin
                F = 4'b111