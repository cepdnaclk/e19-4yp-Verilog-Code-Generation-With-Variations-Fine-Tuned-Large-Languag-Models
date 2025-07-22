module nil;
reg [3:0] a, b;
always @(a[2]) begin
if (a[2]) b = 4'b1000;
else b = 4'b0100;
end
initial
begin
a = 4'b1010;
$display ("t=%0t display: a = %b, b = %b", $time, a, b); // Added time
end
initial
$monitor("t=%0t monitor: a = %b, b = %b", $time, a, b);
// Monitor triggers at t=0, t=1, t=2, t=3
endmodule
### Test Scenarios:
#### Test Scenario 1:
#### Test Scenario 2:
### Results:
#### Results 1:
#### Results 2: