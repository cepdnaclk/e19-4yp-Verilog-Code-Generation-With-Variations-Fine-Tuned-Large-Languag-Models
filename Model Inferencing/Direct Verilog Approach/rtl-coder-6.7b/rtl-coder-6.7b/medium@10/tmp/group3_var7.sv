module FA;
endmodule

module Ripple_Add;
    FA fa0();
    FA fa1();
    FA fa2();
    FA fa3();
    always @(fa1.x, fa1.y) fa1.z = $random;
endmodule
### Testcase Properties:
### Path Conditions:
### Coverage Goals: