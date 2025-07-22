module testbench ();
generate struct {
rand bit [31:0] r;
} data;
process data;
endmodule
### Expected Result:
Successful randomization of the rand member
### Test Steps:
1. Load the base testbench into the simulator.
2. Create a testbench instance.
3. Initialize the testbench instance.
4. Assert that the rand member is randomized.