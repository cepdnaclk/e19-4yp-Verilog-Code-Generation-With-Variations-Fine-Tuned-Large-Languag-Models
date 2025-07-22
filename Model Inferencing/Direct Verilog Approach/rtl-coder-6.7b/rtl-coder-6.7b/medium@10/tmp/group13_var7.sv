wire [3:0] o; // Changed wire declaration to [3:0]
wand wand1(i1,i2,o[2:2]); // Changed to slice range of o for wand1
if(o[0]) // Added if statement
else if(o[3:1] == 3'b100)
### Test Bench Code:
initial
begin
i1=0; i2=0; // Drv1=pull0, Drv2=pull0 -> o = pull0 (wand rule)
end
initial $monitor($time,"i1=%b,i2=%b,o=%b",i1,i2,o); // Added o to monitor
initial #8 $stop; // Added stop
initial $monitor($time,"o=%b",o); // Now monitor just o
### Results:
`timescale 1ns/1ns
tst_wand1:
20 i1=0,i2=0,o=0       tst_wand1:
20 o=0
24 i1=0,i2=0,o=0       tst_wand1:
24 o=0
28 i1=0,i2=0,o=0       tst_wand1:
28 o=0
32 i1=0,i2=0,o=0       tst_wand1:
32 o=0
36 i1=0,i2=0,o=0       tst_wand1:
36 o=0
40 i1=0,i2=0,o=0       tst_wand1:
40 o=0
44 i1=0,i2=0,o=0       tst_wand1:
44 o=0
48 i1=0,i2=0,o=0       tst_wand1:
48 o=0
52 i1=0,i2=0,o=0       tst_wand1:
52 o=0
56 i1=0,i2=0,o=0       tst_wand1:
5