module FA;
    input A, B;
    wire Y;
    assign Y = A ^ B;
endmodule

module Ripple_Add;
    input [4:0] A;
    input [4:0] B;
    output reg [4:0] Y;
    FA fa0();
    FA fa1();
    FA fa2();
    FA fa3();
    always @*
        begin
            fa0.A = A[0];
            fa0.B = B[0];
            fa1.A = A[1];
            fa1.B = B[1];
            fa2.A = A[2];
            fa2.B = B[2];
            fa3.A = A[3];
            fa3.B = B[3];
            fa0.Y = fa1.Y;
            fa1.Y = fa2.Y;
            Y = fa3.Y;
        end
endmodule
### Verilog Modelsim Simulation Result:
![Simulation Result](https://github.com/J-Jie/EE192_Project/blob/main/2-Verilog/project_2/Simulation%20Result%202.png)
##