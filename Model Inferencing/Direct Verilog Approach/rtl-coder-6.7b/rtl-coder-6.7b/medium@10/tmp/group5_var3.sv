module test_k;
reg q, clock, j, k, preset, clear;
jkEdgeFF jk(q, clock, j, k, preset, clear);
initial
begin
reset_ff;
j = 1;
k = 0;
logic[3:0] a[3][4];
a[2][3] = 1;
end
m555 timer(clock);
endmodule
### Expectations:
The Verilog compiler should produce an error when a procedural assignment is made to a constant index.
### Test Steps:
Compile with:
$ vivado -nojournal -log vivado.log -mode batch -source design.tcl
### Check Results:
Check vivado.log for the following messages:
WARNING: [SCH 9-624] Procedural assignments are not supported for constant indices in a module port.