```
function [3:0] maj_3(input [3:0] a, b, c);
    always @(a, b, c) begin
        maj_3 <= {a & b, b & c, c & a, a + b + c};
    end
endfunction
```

#### Base Verilog Code:
```
module count_ones (a, b, c, out1, out2);
input a, b, c;
output out1, out2;
wire im1, im2, im3;
and #(2, 4)
    (im1, a, b),