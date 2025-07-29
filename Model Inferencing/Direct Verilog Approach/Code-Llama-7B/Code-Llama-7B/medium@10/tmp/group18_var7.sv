timescale 1ns/100ps
module maj3_p (input a, b, c, output y);
wire im1, im2, im3, im4, im5, im6, im7;
parameter
    tplh1=2, tphl1=4,
    tplh2=3, tphl2=5;
and #(tplh1, tphl1)
    (im1, a, b),
    (im2,