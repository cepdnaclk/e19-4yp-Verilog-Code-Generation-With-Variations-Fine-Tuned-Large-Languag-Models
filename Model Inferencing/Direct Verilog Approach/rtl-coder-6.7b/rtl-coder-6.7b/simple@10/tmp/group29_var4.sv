module SchedDelayA;
reg a, b;
parameter class C = new;
reg [C::*] x;
initial
begin
end
always @(b) a = x[C];
always @(a) x[C] = b;
endmodule
### Pre-Conditions:
### Post-Conditions:
### Other Comments: