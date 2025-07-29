module SchedDelayB;
class C;
endclass
reg a;
C b[$];
initial
begin
end
always @(C::b[0]) a = C::b[0];
endmodule
### Resulting Error(s):
Error: (vsim-3055) C:/altera/1