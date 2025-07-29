module tst_wand8; //testbench
reg i1,i2[7:0];
wire [7:0] o;
wand8 ww(i1,i2,o);
initial
begin
i1=0