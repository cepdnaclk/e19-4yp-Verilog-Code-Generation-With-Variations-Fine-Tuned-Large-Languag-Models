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
endmodule
`timescale 1ns/100ps
module maj3 (input a, b, c, output y);
wire im1, im2, im3;
parameter
    tplh1=2, tphl1=4,
    tplh2=3, tphl2=5;
and #(tplh1, tphl1)
    (im1, a, b),
    (im2, b, c),
    (im3, c, a);
or #(tplh2, tphl2) (y, im1, im2, im3);

always @(a, b, c)
  begin
  $display("a=%0d, b=%0d, c=%0d", a, b, c);
  y <= maj3_p(a, b, c);
  end

endmodule
### Simulation Results:
a=0, b=0, c=0
a=0, b=0, c=1
a=0, b=1, c=0
a=0, b=1, c=1
a=1, b=0, c=0
a=1, b=0, c=1
a=1, b=1, c=0
a=1, b=1, c=1