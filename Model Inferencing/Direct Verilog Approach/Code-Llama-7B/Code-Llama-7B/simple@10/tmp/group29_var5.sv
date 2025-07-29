module SchedDelayA;
class cls;
input a;
input b;
endclass
reg cls c_a [0:1];
initial
begin
end
always @(c_a[1].b) c_a[1].a = c_a[1].b;
always @(c_a[0].a) c_a[0].b <= c_a[0].a;
endmodule

### Variation Description:
This variation introduces a class handle to access an associative array with a class member inside operator.

### Testing Procedure and Expected Results
For the given variation of the testbench (with the modified code), no error was reported.

### Pass/Fail Criteria
Test passes if the design does not crash.

### Comments

### Pre-Simulation

### Post-Simulation