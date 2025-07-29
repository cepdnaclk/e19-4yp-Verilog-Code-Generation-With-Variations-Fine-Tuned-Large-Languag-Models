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
always @(im3) y = im1[0]? a : (im2[0]? b : c);
endmodule
### Listing of VHDL architecture:
```
architecture dataflow of mult_4bit is
    signal s1, s2, s3: std_logic_vector(4 downto 0); 
begin
    s1 <= a1_i and b1_i;
    s2 <= a2_i and b2_i;
    s3 <= a3_i and b3_i;
    c1_o <= s1(0) xnor s2(0) xnor s3(0);
    c2_o <= s1(1) xnor s