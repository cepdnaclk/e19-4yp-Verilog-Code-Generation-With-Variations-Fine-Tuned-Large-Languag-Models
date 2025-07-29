```verilog
module maj3_var (a, b, c, y);
input [2:0] a, b, c;
output y;
wire im1, im2, im3;
and #(2, 4) (im1, a[2], b),
            (im2, b, c),
            (im3, c, a);
or #(3, 5) (y, im1, im2, im3);
endmodule
```
### Modified Testbench:
```verilog
module maj3_var_tb ();
    reg [2:0] a, b, c;
    wire y;

    maj3_var uut (
       .a(a),
       .b(b),
       .c(c