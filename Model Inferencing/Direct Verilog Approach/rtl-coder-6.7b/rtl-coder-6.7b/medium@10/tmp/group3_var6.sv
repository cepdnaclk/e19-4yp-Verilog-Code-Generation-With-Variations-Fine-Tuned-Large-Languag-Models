module FA;
endmodule

module Ripple_Add;
    FA fa0();
    FA fa1();
    FA fa2();
    FA fa3();

    always @* begin
      fa0.out = fa0.a | fa0.b | fa0.cin;
      fa1.out = fa1.a | fa1.b | fa1.cin;
      fa2.out = fa2.a | fa2.b | fa2.cin;
      fa3.out = fa3.a | fa3.b | fa3.cin;
    end
endmodule