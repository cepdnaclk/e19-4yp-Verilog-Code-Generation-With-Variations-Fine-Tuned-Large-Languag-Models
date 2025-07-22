module tst_nor2; //testbench
reg i1,i2;
wire o; // Added wire declaration
nor2 nr(i1,i2,o);
initial
begin
  i1=0; i2=1; // Drv1=pull0, Drv2=pull1 -> o = pull1 (nor rule)
end
initial $monitor($time,"i1=%b,i2=%b,o=%b",i1,i2,o);
initial #8 $stop; // Added stop
endmodule
### Generated Code:
module tst_nor2; //testbench
reg i1,i2;
wire o; // Added wire declaration
nor2 nr(i1,i2,o);
initial
begin
i1=0; i2=1; // Drv1=pull0, Drv2=pull1 -> o = pull1 (nor rule)
end
initial $monitor($time,"i1=%b,i2=%b,o=%b",i1,i2,o);
initial #8 $stop; // Added stop
endmodule
## Testbench File:
### Base Verilog Code:
module tst_or1; //testbench
reg i1,i2;
wire o; // Added wire declaration
or1 or(i1,i2,o);
initial
begin
i1=0; i2=0; // Drv1=pull0, Drv2=pull0 -> o = pull0 (or rule)
end
initial $monitor($time,"i1=%b,i2=%b,o=%b",i1,i2,o);