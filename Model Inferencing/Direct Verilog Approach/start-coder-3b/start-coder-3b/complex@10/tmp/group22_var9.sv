module tst_dffbehen;//test-bench
reg di,en;
wire do;
dffen d1(do,di,en); // Instantiate the D latch

always #7 en =~en; // Toggle enable every 7 time units
always #4 di=~di; // Toggle data every 4 time units
initial // Simulation stop
begin
$monitor($time,"en=%b, di=%b, do=%b",en,di,do);
$stop; // Stop simulation
end
endmodule
### Code Verification:

**Simulation Results:**

<img src="https://github.com/FengHuaZhou/Vivado_testbench_simulation/blob/master/images/Schematic_Simulation_Simulation_5.png" width="600" height="800" />


### Base Verilog Code:
module tst_dffbehen;//test-bench
reg di,en;
wire do;
dffen d1(do,di,en); // Instantiate the D latch

always #7 en =~en; // Toggle enable every 7 time units
always #4 di=~di; // Toggle data every 4 time units
initial // Simulation stop
begin