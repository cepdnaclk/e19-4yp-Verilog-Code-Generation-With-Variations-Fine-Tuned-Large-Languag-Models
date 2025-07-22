module AndOr (output X, Y, input A, B, C);
bit [1:0] C_bit;
always @* begin
C_bit = C & [1:0];
end
assign #10 X = A & B;
assign #10 Y = B | C_bit;
endmodule
### Expected behavior:
1. The Vivado tool should be able to compile the modified code.
2. The synthesis results should be verified with expected value.
### Actual Behavior:
1. The Vivado tool is able to compile the modified module but the synthesis results seems to differ from the expected value.
### Steps to reproduce the behavior:
1. Run Synplify under Xilinx project and get the expected value.
2. Run the modified module and check the synthesis result.

## Other information

### Versions
Vivado 2019.2

### Additional information
None

### Environment

Additionally, the modified module is used in a system containing other modules, the following steps are required:

1. Copy the modified module to another directory.
2. Add the path to the copy to SystemVerilog work path.
3. Include the modified module in top level (or any module).

This also seems to work in SystemVerilo if the module is not copied to another directory.

### Checklist

###### Is the issue an expected behavior?

[ ] Yes
[X] No

###### Did you check Vivado Log?

[ ] Yes
[X] No

###### Did you check Xilinx Log?

[ ] Yes
[X] No

###### Did you check SystemVerilog Log?

[ ] Yes
[X] No

###### Did you check Report?

[ ] Yes
[X] No

###### Is the issue a regression?

[ ] Yes
[X] No

###### Did you check the user guide?

[ ] Yes
[X] No

###### Did you check FAQ?

[ ] Yes
[X] No

###### Did you check Issue List?

[ ] Yes
[X] No

###### Did you check on other tools?

[ ] Yes
[X] No

###### Did you check other people's bugs?

[ ] Yes
[X] No