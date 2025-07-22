```diff
+   packed struct {
+       signed [5:0] dly_a = 1'bs0, dly_b = 1'bs0;
+       signed [5:0] dly_s = 1'bs0, dly_c = 1'bs0;
+   } delays;
+   
+   inout s; inout ca;
+  
+   parameter dly_a1 = 3; parameter dly_b1 = 2;
+   parameter dly_s1 = 1; parameter dly_c1 = 4;
+  
+   delays = unpack(32'd1, 32'd2);
+   
+   ha_1(s,ca,a,b);
+   
+   delay #(delays.dly_a1) s <= a;
+   delay #(delays.dly_b1) ca <= b;
+   delay #(delays.dly_s1) s <= a ^ b;
+   delay #(delays.dly_c1) ca <= a & b;
```

### Output:
```
## Top-level Simulation (Active-HDL Verilog)

### Command:
./hdl_exe ha_1_sim.v

### Command Line Options:
-

### Output Log (Simulation Details):

### Simulation Time:
Elapsed Time: 0.000000000 seconds.

### Simulation Information:
Verilog $timescale command has been ignored.
Verilog $elaborate command has been ignored.
Verilog $stop command has been ignored.
Verilog $finish command has been ignored.
Verilog $stop command has been ignored.
Verilog $stop command has been ignored.
Verilog $stop command has been ignored.

### Simulation Summary:

### Simulation Results:

|      Module  |   Instance  |   Expected  |   Actual  |  Expected  |   Actual  |
|--------------|-------------|-------------|-----------|------------|-----------|
| ha_1_sim_tb |             |             |           |            |           |
|              |             |             |           |            |           |
|              |             |             |           |            |           |

### Simulation Passes:
Simulation Passed

### Simulation Warnings:

### Simulation Error:

### Simulation Error Message:

### Simulation End Time:
Current Simulation Time: 0.000000000 seconds.

### Simulation Exit Status:
0

## Top-level Simulation (ModelSim)

### Command:
./modelsim.sh

### Command Line Options:
-

### Output Log (Simulation Details):

### Simulation Time:
Elapsed Time: 0.000 seconds.

### Simulation Information:
Verilog $timescale command has been ignored.
Verilog