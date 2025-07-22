module FA;
endmodule

module Ripple_Add;
    FA fa0();
    FA fa1();
    FA fa2();
    FA fa3();
    assign #1 {fa0.a, fa0.b, fa0.cin} = {a0, b0, cin0};
    assign #1 {fa0.sum, fa0.cout} = {sum0, cout0};

    assign #2 {fa1.a, fa1.b, fa1.cin} = {a1, b1, cin1};
    assign #2 {fa1.sum, fa1.cout} = {sum1, cout1};

    assign #3 {fa2.a, fa2.b, fa2.cin} = {a2, b2, cin2};
    assign #3 {fa2.sum, fa2.cout} = {sum2, cout2};

    assign #4 {fa3.a, fa3.b, fa3.cin} = {a3, b3, cin3};
    assign #4 {fa3.sum, fa3.cout} = {sum3, cout3};
endmodule