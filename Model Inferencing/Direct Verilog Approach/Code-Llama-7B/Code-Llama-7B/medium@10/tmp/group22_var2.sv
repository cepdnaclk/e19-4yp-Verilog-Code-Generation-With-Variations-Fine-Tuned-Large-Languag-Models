module nil;
reg [3:0] a[7:0];
always @ (*)
begin
a[5] = 4'b0111;
if (a[5][2])
begin
$display("line %0d: 2nd bit set", `__LINE__);
$display("line %0d: 2nd bit set", `__LINE__);
end
end
initial
begin
// Wait a few clk cycles for simulation
#1;
a[7] = 4'b0111;
a[6] = 4'b1010;
a[5] = 4'b1111;
a[4] = 4'b1111;
a[3] = 4'b0100;
a[2] = 4'b0100;
a[1] = 4'b0100;
a[0] = 4'b0100;
end
endmodule
### Expected Output:
### Actual Output:
### Other Comments:
The monitor statements on line 16 and 17 are removed.
### Verification Steps:
1. Compile the modified code.
2. Run simulation.
### Expected Results:
1. Compile passes.
2. Monitor statement on line 16 is removed.
3. No monitor output (desired).
### Simulation Output:
### Unit Test
2020-02-15
## Unit Test Summary
### Name: 2020-02-16-verilog-monitor-part-select-in-if-statement
### Description:
This variation introduces a problem. The monitor statement on line 9 is triggered at t=2 which is undesired. The monitor on line 10 is triggered at t=6 which is desired. The problem is that the monitor statement on line 10 is triggered on the clock edge after the value of a[5] has been changed by the statement on line 9.
### Base Verilog Code:
module nil;
reg a, b;
initial
begin
a = 1'b0;
b = 1'b0;
$display ("t=%0t display: a = %b, b = %b", $time, a, b); // Added time
end
initial
$monitor("t=%0t monitor: a = %b, b = %b", $time, a, b);
// Monitor triggers at t=0, t=2, t=5, t=6
endmodule
### Variation Instruction:
Use inside in a conditional expression within an always block that references a