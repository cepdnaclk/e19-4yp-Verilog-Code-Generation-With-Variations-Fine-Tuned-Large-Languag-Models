module nil;
wire [3:0] a, b;
assign b = a[<1]; // Changed b = 4'b1010 to b = a[<1]
initial
begin
a = 4'b0101;
$display ("t=%0t display: a = %b, b = %b", $time, a, b);
$monitor("t=%0t monitor: a = %b, b = %b", $time, a, b);
end
endmodule
### Verification Steps:
1. Launch the Verification Concolic Execution Engine (VCEE) and run the above code
2. Choose a value for the variable <i>a[<1]</i> using the drop-down list at the top of the screen
3. VCEE presents the modified code in the bottom pane.
### Expected Result:
VCEE presents the modified code modified code such that the monitor statement triggers at each time step in which the specified expression <i>a[<1]</i> changes value.
### Actual Result:
VCEE displays the following error message:
```
Parse error at netlist line 5:
assign b = a[<>1]; // Changed b = 4'b1010 to b = a[<1>]
       ^^ 2 errors parsing verilog expression
```
### Pass/Fail Criteria:
Passes if VCEE produces the expected result. Fails if not.

### Comments:
The VCEE should support any use of array subscripts in the left-hand side of an assignment statement.

### Note:
This test case was originally coded in the form presented here, but the test failed due to a bug in the code.

## Test Case #29
### Base Verilog Code:
module nil;
wire [3:0] a, b