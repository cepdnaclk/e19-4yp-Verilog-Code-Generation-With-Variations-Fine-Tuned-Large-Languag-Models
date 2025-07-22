module SchedDelayA;
reg a, b;
initial
begin
end
always @(b) a = b;
always @(a) b <= a;
endmodule
### Expected Results:
No change.
### Fixed Results:
No change.
### Changes:
- Add tests for class-based associative accesses
- Fix bug in the module that caused the issue
- Add test cases
- Update documentation

## Issue 1951:
### Base Verilog Code:
module SchedDelayA;
reg a, b;
initial
begin
end
always @(b) a = b;
always @(a) b <= a;
endmodule
### Variation Instruction:
Replace one of the inputs with a class handle and use inside