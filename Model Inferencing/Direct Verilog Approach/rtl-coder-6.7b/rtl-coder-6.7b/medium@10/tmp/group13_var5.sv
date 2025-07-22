module tst_wand1; //testbench
reg i1,i2;
wire o;
wand1 ww(i1,i2,o);
initial
begin
i1=0; i2=0; // Drv1=pull0, Drv2=pull0 -> o = pull0 (wand rule)
end
initial $monitor($time,"i1=%b,i2=%b,o=%b",i1,i2,o);
initial #8 $stop;
endmodule