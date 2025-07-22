module FA;
    output [3:0] A;
    input [3:0] B;
    output [3:0] Z;
    // output [3:0] S;
    wire [3:0] S;
    wire [3:0] C;

    always @(A or B) begin
        Z = A + B;
    end

    always@(A or B) begin
        S = A & B;
        C = A ^ B;
    end
endmodule

module Ripple_Add;
    FA fa0();
    FA fa1();
    FA fa2();
    FA fa3();

endmodule

### Expected Behavior:
The test should pass.

### Actual Behavior:
The test fails.

### Steps To Reproduce:
1.  Change the always block of FA to
    always@(A or B) begin
        Z = A + B;
    end
2.  Rerun the test

### System Information