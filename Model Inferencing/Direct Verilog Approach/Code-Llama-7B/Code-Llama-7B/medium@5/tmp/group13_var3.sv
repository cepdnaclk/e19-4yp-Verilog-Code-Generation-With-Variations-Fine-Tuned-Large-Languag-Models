module tst_wand1; //testbench
reg i1,i2;
wire o; // Added wire declaration
wand1 ww(i1,i2,o);
initial
begin
i1=