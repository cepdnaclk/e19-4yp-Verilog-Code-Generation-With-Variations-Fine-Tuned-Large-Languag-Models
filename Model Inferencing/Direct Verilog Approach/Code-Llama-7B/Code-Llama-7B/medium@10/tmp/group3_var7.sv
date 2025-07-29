module Ripple_Add;
    FA fa0();
    logic [3:0] b;

    always @* begin
        fa0.A = A[0:0];
        fa0.B = b;
    end
endmodule
### Comments:
A variable expression is used for B in fa0.
### Compliance:
IEEE 1800-2017 4.4.2.1
IEEE 1800-2017 11.4.2.1
IEEE 1800-2017 11.5.2.1
IEEE 18