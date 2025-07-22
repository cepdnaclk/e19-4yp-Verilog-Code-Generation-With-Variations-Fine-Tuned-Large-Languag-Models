timescale 1ns/100ps
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

```

When executed on Altera FPGA, the clock period of the generated clock is 10ns and the toggle rate of the generated clock is: 48000.