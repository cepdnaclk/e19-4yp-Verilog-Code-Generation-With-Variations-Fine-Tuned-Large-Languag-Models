module aoi2(g,a,b,c,d);
output g;
input a,b,c,d;
wire e,f,g1; // Intermediate signals
// Dataflow assignments for AND, OR, and NOT operations
initial begin
e = (a  & b);
f = (c & d);
g1 = (e | f);
g = ~g1; // Final AOI output
end
endmodule
### Testbench Code:
`timescale 1ns / 1ps
module top;
reg a,b,c,d;
wire g;
aoi2 dut(g,a,b,c,d);
initial begin
$dumpfile("aoi2.vcd");
$dumpvars(0, top);
a=0;
b=0;
c=0;
d=0;
#20
a=1;
b=1;
c=1;
d=1;
#20
a=1;
b=1;
c=0;
d=0;
#20
a=0;
b=1;
c=0;
d=1;
#20
a=0;
b=0;
c=0;
d=1;
$finish;
end
endmodule
### Output:
### Screenshot:
![image](https://user-images.githubusercontent.com/93427941/221403614-090bc256-bb3e-4b62-85c2-94e5224eea90.png)
![image](https://user-images.githubusercontent.com/93427941/221403623-8911e5a2-0e6c-443a-bab1-7f12e7935180.png)
![image](https://user-images.githubusercontent.com/93427941/221403626-9759112e-4458-45c4-