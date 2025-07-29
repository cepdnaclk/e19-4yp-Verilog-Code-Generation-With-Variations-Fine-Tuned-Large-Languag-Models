module tst_CMOSsw1();
  reg in,con; wire out;
  CMOSsw1 cmsw[4:0](out[3:0],in,con); // Instantiate CMOS switch
  initial begin in=1'b0; con=1'b1; end // Start enabled
  always #5 in =~in; // Toggle data
  always #3 con=~con; // Toggle control
  initial $monitor($time, "in = %b, con = %b, output = %b ",(in&con),con,out[3:0]);
  initial #20 $stop; // Stop simulation
endmodule
### Explanation:
If the 'always' block is uncommented, the code will generate a warning message, saying that the width of the expression on the left is less than the width of the expression on the right.
As such, this variation will fail.
However, when the 'always' block is commented as shown above, the function call result will be sliced to the appropriate width to perform the comparison, which will succeed.
As such, this variation will pass.
### Passed Variation:
The 'always' block is commented out.
### Failed Variation:
The 'always' block is uncommented, which causes a warning message to be generated.
### Notes:
No notes.
### Original Author:
Philip Tovstogan
### Current Maintainer:
Philip Tovstogan
### Hardware:
This test was developed and tested on a VMWare virtual machine running Ubuntu Server 16.04.
### Software:
The test was developed and tested using QuestaSim-10.1c, which comes with the Cadence Design Systems Virtuoso 2016.06.03.
### Test Method:
This test involves two blocks:
The first block is a verilog module that contains a CMOS switch.
The second block is a testbench verilog file that instantiates the CMOS switch module once for each variation.
The testbench creates two inputs and one output.
It then enables the CMOS switch, toggles the inputs, and monitors the outputs.
### Coding:
The verilog module was written to test a function call with a slice range.
The testbench file instantiates the CMOS switch four times.
The testbench creates two inputs and one output.
It then enables the CMOS switch, toggles the inputs, and monitors the outputs.
### Testing:
The simulated results are displayed on the screen.
If the results match the expected results, the variation will pass.
If the results do not match the expected results, the variation will fail.
### Results:
The following results were obtained:
Failed variation: The 'always' block is uncommented.
Passed variation: The 'always' block is commented out.
### Analysis:
The CMOS swtich in the verilog module is a 2-input NAND gate.
As such, when both inputs are low, the output is high.
When one input is high and the other input is low, the output is low.
When both inputs are high, the output is low.
As such, the function call result in the second instance of the CMOS switch is not being sliced to the appropriate width, which results in a mismatch in the verification results.
### Conclusion:
When a function call result is indexed into an array, the code must slice the result to the appropriate width, to avoid mismatching the width of the indexed result.
## Reference
[1] Reference: Slice range on function call to index array (https://support.