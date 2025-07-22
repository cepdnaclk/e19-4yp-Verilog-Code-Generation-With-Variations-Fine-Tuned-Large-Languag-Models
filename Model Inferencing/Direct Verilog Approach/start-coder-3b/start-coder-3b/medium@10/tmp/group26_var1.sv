module example12(x1, x2, x3, x4, x5, x6, f);
input x1, x2, x3, x4, x5, x6;
output f;
reg f;
always @(x1 or x2 or x3 or x4 or x5 or x6)
    if (x1 == 1)
        f = x2;
    else
        f = x1;
endmodule
```

### example13
```verilog
### Base Verilog Code:
module example13(x1, x2, x3, x4, x5, x6, f);
input x1, x2, x3, x4, x5, x6;
output f;
reg f;
always @(x1 or x2 or x3 or x4 or x5 or x6)
    if (x1 == 1)
        f = x2;
    else if (x5 == 5)
        f = x4;
    else if (x6 == 6)
        f = x5;
    else
        f =