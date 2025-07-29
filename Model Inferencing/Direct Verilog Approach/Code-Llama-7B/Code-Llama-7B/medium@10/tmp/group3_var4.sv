module Ripple_Add;
    FA fa0();
    FA fa1();
    FA fa2();
    FA fa3();
    int A[3:0];
    int B[3:0];
    int C[1:0];
    int D;
    wire [2:0] result;
    always @* begin
        result = {C, B, A};
    end
    assign fa0.A = A;
    assign fa0.B = B;
    assign fa0.C = C;
    assign C = fa0.D;
    assign fa1.A = C;