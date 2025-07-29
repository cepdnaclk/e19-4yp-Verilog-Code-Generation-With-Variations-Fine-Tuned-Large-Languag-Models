module dff(do,di,clk); // Behavioral D Flip-Flop
output do;
input di,clk;
reg do; // Output must be reg for procedural assignment
initial
do=1'b0; // Initialize output
// Assign input 'di' to output 'do' on negative clock edge
always@(negedge clk) do = di; // Use non-blocking <= for sequential logic
endmodule
module test;
reg [7:0] data_array[0:3];

integer i;
reg clk;
dff DFF(.do(data_array[i]),.di(data_array[i+1]),.clk(clk));
initial begin
clk=1;
for(i=0;i<=3;i++)begin
data_array[i]=i;
#10;
end
clk=~clk;
end
endmodule
### Expected Result:
Test Passed
### Actual Result:
Sorry, there was a problem with the build.

[15:49:01] vlog -v2004 -work work DFF.v
[15:49:07] vlog -v2004 -work work test.v
[15:49:08] elapsed time: 00:00:01.94