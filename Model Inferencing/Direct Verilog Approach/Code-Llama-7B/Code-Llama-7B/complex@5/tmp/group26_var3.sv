`if (i inside {[0:3]})` // modified line 14
### Result: - Verilator
| Time |                 1 |
|:----:|:------------------:|
|   0s | 100111111111111111 |
### Result: - Verilog
| Time |                 1 |
|:----:|:------------------:|
|   0s | 100111111111111111 |
### Analysis
There seems to be a bug with `inside` in verilator. Please note that the `inside` condition is not even met in the verilog simulation. (Also, this is the reason why we use `always @*` in `jerkycomparator.v`). This can be debugged only by simulating the file in other simulators such as Modelsim, etc. The below message is just to show the result without `inside` condition: