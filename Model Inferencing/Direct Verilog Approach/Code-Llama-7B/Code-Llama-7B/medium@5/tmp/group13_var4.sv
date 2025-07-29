module tst_wand1; //testbench
reg i1,i2;
wire o; // Added wire declaration
wand1 ww(i1,i2,o);
initial
begin
i1=0; i2=0; // Drv1=pull0, Drv2=pull0 -> o = pull0 (wand rule)
if(i1[1:0]!=i2[1:0]) begin
$display("IF");
end
end
initial $monitor($time,"i1=%b,i2=%b,o=%b",i1,i2,o);
initial #8 $stop; // Added stop
endmodule
### Modification:
Use inside in an if statement on an array slice operand indexed by a variable and test against part-select range.
### Variation Instruction:
Use inside an if statement on an array slice operand indexed by a range of variables and test against