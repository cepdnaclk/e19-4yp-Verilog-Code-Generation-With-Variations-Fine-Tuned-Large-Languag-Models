module example6(x, y, z, out);
input [1:0] x,y,z;
output [1:0] out;

always @(x or y or z)
    case ({x, y, z})
        (0,0,0): out = 0;
        (0,0,1): out = 1;
        (0,1,0): out = 2;
        (0,1,1): out = 3;
        (1,0,0): out = 4;
        (1,0,1): out = 5;
        (1,1,0): out = 6;
        (1,1,1): out = 7;
        default: out = 8;
    endcase
endmodule
```

# 12.14.7

```
### Base Verilog Code:
module example7(x1, x2, f);
input x1, x2;
output f;

always @(x1 or x2)
case (x1,x2)
    (0,0): f = 0;
    (1,0): f = 1;
    (0,1): f = 2;