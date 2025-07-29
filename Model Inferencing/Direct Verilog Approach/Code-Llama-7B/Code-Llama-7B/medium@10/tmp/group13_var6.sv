module tst_nor1_lut_array; //testbench
reg [15:0] i1,i2;
wire o; // Added wire declaration
nor1 nn(i1[7:6],i2[7:6],o);
initial
begin
i1=0; i2=0; //