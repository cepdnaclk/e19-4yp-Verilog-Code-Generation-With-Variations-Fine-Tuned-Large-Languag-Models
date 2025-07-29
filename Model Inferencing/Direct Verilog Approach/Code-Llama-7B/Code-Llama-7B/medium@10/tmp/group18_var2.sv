`timescale 1ns/100ps
module maj3_p (input a, b, c, output y);
wire im1, im2, im3;
parameter
    tplh1=2, tphl1=4,
    tplh2=3, tphl2=5;
and #(tplh1, tphl1)
    (im1, a, b),
    (im2, b, c),
    (im3, c, a);
or #(tplh2, tphl2) (y, im1, im2, im3);

always@(posedge c)
begin
y<=a||b||c;
end

endmodule
### Test Bench:
`timescale 1ns/100ps

module test_maj();

reg a, b, c, clk, rst;
wire y;

maj3_p uut (
   .a(a)   ,.b(b),.c(c),    .y(y),
   .clk(clk),.rst(rst)
    );

initial begin
//rst=1;
a=1'b0;
b=1'b0;
c=1'b0;
#10;

a=1'b0;
b=1'b0;
c=1'b1;
#10;

a=1'b0;
b=1'b1;
c=1'b0;
#10;

a=1'b0;
b=1'b1;
c=1'b1;
#10;

a=1'b1;
b=1'b0;
c=1'b0;
#10;

a=1'b1;
b=1'b0;
c=1'b1;
#10;

a=1'b1;
b=1'b1;
c=1'b0;
#10;

a=1'b1;
b=1'b1;
c=1'b1;
#10;

$finish;
end
endmodule
### Results Log:
```
** Note: The following log may vary depending on your