module test_l;
wire q, clock, l, preset, clear;
reg l;
jkEdgeFF jk[0:13](q, clock, 1'd1, 1'd1, l, preset, clear);
initial
begin
reset_ff;
l = 1;
end
m555 timer(clock);
endmodule
### Test Case ID:
l_014_1
### Pass Criteria:
Predicate passing: 100
### Failed Criteria:
Predicate failing: 0
### Difficulty Level:
1
### Assumptions:
none
### Design Help:
none
### Algorithm:
none
### Pseudocode:
none
### Testing:
none
### Note:
none
### Code Start
### Base Verilog Code:
module test_m;
wire q, clock, m, preset, clear;
reg m;
jkEdgeFF jk(q, clock, 1'd1, 1'd1, m, preset, clear);
initial
begin
reset_ff;
m = 1;
end
m555 timer(clock);
endmodule
### Variation Instruction:
Add a procedural assignment to the same 1-bit logic array to test MSA behavior