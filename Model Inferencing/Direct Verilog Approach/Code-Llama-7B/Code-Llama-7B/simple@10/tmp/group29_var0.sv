module SchedDelayA;
reg a, b;
initial
begin
end
always @(b) a = @(b) b;
always @(a) b > a;
endmodule
### Original Context:
None
### Variation Instruction:
Change `>=` to `>`.
### Modified