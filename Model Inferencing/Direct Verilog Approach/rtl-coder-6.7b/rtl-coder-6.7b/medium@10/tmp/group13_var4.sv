module tst_wand1; //testbench
reg i1,i2;
wire o; // Added wire declaration
wand1 ww(i1,i2,o);
initial
begin
i1<=1; // Drv1=pull1, Drv2=pull1 -> o = pull1 (wand rule)
end
initial $monitor($time,"i1=%b,o=%b",i1,o);
initial #8 $stop; // Added stop
endmodule
### Results:
The results when adding the pull1 to the variable and it is outside the if statement are as expected.


### Base Verilog Code:
module tst_wand1; //testbench
reg i1,i2;
wire o; // Added wire declaration
wand1 ww