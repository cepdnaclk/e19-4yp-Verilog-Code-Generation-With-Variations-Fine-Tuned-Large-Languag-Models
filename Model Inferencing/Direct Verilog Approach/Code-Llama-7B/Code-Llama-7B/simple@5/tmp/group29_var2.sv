module SchedDelayA;
reg a, b;
logic c;
logic d;
initial
begin
end
always @(b) a = b;
always @(a) b <= a;
always @(c) c <= c;
always @(d) d <= d;
endmodule
### Variation Instruction:
Replace all internal connections with class handles to test associative access using inside operator for class handles