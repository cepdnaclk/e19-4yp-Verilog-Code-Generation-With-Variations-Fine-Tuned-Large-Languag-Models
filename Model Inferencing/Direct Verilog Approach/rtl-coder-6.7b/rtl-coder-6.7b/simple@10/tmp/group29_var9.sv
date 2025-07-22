module SchedDelayA;
reg a, b;
class C;
reg a, b;
endclass
C c = new;
initial
begin
end
always @(b) a = c[b];
always @(a) c[a] = b;
endmodule
### Assertion:
### SV-RTLSim:
### SV-Sim:
### Simulator:
### Synthesis:
### Synthesis Results:
top_0|