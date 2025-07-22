module FA;
endmodule

module Ripple_Add;
    FA fa0();
    FA fa1();
    FA fa2();
    FA fa3();
    always @* begin
        fa1.in_1.in_a[2:1];
    end
endmodule