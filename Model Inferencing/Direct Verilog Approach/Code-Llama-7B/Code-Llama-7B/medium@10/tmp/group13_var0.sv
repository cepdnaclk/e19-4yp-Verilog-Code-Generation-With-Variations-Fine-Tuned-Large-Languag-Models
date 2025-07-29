module tst_wand6; //testbench
reg i1,i2,i3,i4,i5,i6,i7,i8;
wire o; // Added wire declaration
wand1 ww[7:0](i1,i2,o);
initial
begin
i1=0; i2=0; i3=