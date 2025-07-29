```
module maj3 (a, b, c, y);
input a, b, c;
output y;
wire im1, im2, im3;
and #(2, 4)
    (im1, a, b),
    (im2, b, c),
    (im3, c, a);
or #(3, 5) (y, im1, im2, im3);
endmodule

module top1 (a, b, c, y);
output [3:0] y;
wire [3:0] a, b, c;
    for(genvar i = 0; i < 4; i++) begin : gen 
        maj3 #(.i(i)) x (a[i], b[i], c[i], y[i]);
    end
endmodule
```
### Expected output:
```

```
### Passing test:
Input files:
```

```
Output:
```
XMR-style index on packed array and constant range
--------------------------------------------------

```
### Failing test:
Input files:
```

```
Output:
```
XMR-style index on packed array and constant range
--------------------------------------------------
ERROR: <