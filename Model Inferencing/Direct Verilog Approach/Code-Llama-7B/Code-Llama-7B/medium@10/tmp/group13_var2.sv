module tst_wand3_a;
reg i1,i2,i3,i4;
wand3 ww(i1,i2,i3,i4);
initial begin
i1=0; i2=0; i3=0; i4=0; // Drv1=pull0, Drv2=pull0, Drv3=pull0, Drv4=pull0 -> o = pull0 (wand rule)
end
initial $monitor($time,"i1=%b,i2=%b,i3=%b,i4=%b",i1,i2,i3,i4);
endmodule

### Base Verilog Code:
module tst_wand4; //testbench
reg i1,i2;
wand4 ww(i1,i2);
initial
begin
i1=0; i2=0; // Drv1=pull0, Drv2=pull0 -> o = pull0 (wand rule)
end
initial $monitor($time,"i1=%b,i2=%b",i1,i2);
initial #8 $stop; // Added stop
endmodule
### Variation Instruction:
Analyze the wand gate with different number of inputs