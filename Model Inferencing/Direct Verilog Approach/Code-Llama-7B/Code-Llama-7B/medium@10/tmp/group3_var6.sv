module Ripple_Add;
    FA fa0();
    FA fa1();
    FA fa2();
    FA fa3();

    always @*
        fa3.C = fa0[1].C? fa2.C : 1'b0;

endmodule
### Variation Verilog Code:
module FA;
    input A;
    input B;
    output C;

    assign C = A? B : 1'b