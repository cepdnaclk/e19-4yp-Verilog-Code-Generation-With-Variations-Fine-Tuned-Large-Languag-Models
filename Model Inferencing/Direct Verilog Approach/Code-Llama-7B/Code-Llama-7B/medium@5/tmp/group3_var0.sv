module Ripple_Carry;
    FA fa0();
    FA fa1();
    FA fa2();
    FA fa3();
    FA fa4();

    always @(a[0:31],cin) begin
        fa0.i = {{cin,a[0:31]}};
    end

    fa1.i = fa0.o[33:35];
    fa2.i = fa1.o[35:37];
    fa3.i = fa2.o[37:39];
    fa4.i = fa3.o[39:41];

endmodule
###