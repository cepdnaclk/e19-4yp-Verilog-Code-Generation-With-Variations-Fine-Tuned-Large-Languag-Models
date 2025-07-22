module example5(x1, x2, x3, f);
input x1, x2, x3;
output f;
reg f;
always @(x1 or x2 or x3)
    if (x2 == 1)
        f = x1;
    else
        f = x3;
    if ({x1, x2, x3}[2:1] inside {[2:3]})
        f = {x1, x2, x3}[0];
endmodule
### Notes:
The original code was valid but was never synthesized. The added if block was never synthesized.
### Flag Explanation:
ERROR_2009
### Verification Strategy:
1.  Verify that the original code is invalid.
2.  Verify that the original code is synthesizable.
3.  Verify that the modified code is invalid.
4.  Verify that the modified code is synthesizable.
### Sample Design File: