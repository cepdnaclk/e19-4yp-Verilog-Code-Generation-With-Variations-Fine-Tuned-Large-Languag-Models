module Ripple_Add;
        FA fa0();
        FA fa1();
        FA fa2();
        FA fa3();
        always @(a, b)
                fa0.c = a[2:1] + b[1:0];
        always @(a, b)
                fa1.c = fa0.c[1] + fa0.c[0] + a[1] + b[0];
        always @(a, b)
                fa2.c = fa1.c[1] + fa1.c[0] + a[1] + b[0];
        always @(a, b)
                fa3.c = fa2.c[1] + fa2.c[0] + a[1] + b[0];
    endmodule

### Test Setup:
### Expected Output:
### Pass Criteria: