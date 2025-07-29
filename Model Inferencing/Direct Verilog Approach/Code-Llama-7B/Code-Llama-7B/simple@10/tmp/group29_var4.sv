module SchedDelayH;
reg a, b;
initial
begin
end
always @(b) a = b;
always @(a) b <= a;
endmodule
### Original Code:
module SchedDelayI;
reg a, b;
initial
begin
end
always @(b) a = b;
always @(a) b <= a;
endmodule
### Variation Instruction:
Replace one of the inputs with a class handle and