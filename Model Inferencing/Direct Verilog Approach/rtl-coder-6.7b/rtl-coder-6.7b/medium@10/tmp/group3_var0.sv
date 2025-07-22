module FA;
endmodule

module Ripple_Add;
    FA fa0();
    FA fa1();
    FA fa2();
    FA fa3();
    always begin
        fa0.p[2:0] = 3;
        fa1 = fa2;
        fa3 = fa0;
        fa4[2:0] = 3;
    end
endmodule