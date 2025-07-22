`module maj3_p (input a, b, c, output y);
wire im1, im2, im3;
parameter
    tplh1=2, tphl1=4,
    tplh2=3, tphl2=5;
nand #(tplh1, tphl1)
    (im1, a, b),
    (im2, b, c),
    (im3, c, a);
array_or #(tplh2, tphl2) (y, im1, im2, im3, ~im1, ~im2, ~im3);
endmodule
### Verification Output:
`
module maj3_p (input a, b, c, output y);
timescale 1ns/100ps
logic [2:0] im1, im2, im3;
parameter tplh1=2, tphl1=4, tplh2=3, tphl2=5;
nand #(tplh1, tphl1) (im1, a, b);
nand #(tplh1, tphl1) (im2, b, c);
nand #(tplh1, tphl1) (im3, c, a);
array_or #(tplh2, tphl2) (y, im1, im2, im3, ~im1, ~im2, ~im3);
endmodule