`timescale 1ns/100ps
module maj3 (input a, b, c, output y);
    wire im1, im2, im3;
    parameter
        tplh1=2, tphl1=4,
        tplh2=3, tphl2=5,
        tplh3=2, tphl3=4,
        tplh4=3, tphl4=5;
    and #(tplh1, tphl