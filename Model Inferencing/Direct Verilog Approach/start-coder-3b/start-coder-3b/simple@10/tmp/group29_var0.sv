module SchedDelayB;
class SchedDelayC;
reg a, b;
endclass

module SchedDelayA;
SchedDelayC d1, d2;
initial
begin
end
always @(b) d1.a = b;
always @(d1.a) d2.b = d1.a;

always @(d1.a) d2.a = d1.a;
always @(d2.a) d1.b = d2.a;

always @(d2.a) d2.b = d2.a;
always @(b) d1.b = b;
endmodule
### Result:

module SchedDelayC;
reg a, b;
endmodule

module SchedDelayA;
SchedDelayC d1, d2;
initial
begin
end
always @(b) d1.a = b;
always @(d1.a) d2.b = d1.a;

always @(d1.a) d2.a = d1.a;
always @(d2.a) d1.b = d2.a;

always @(d2.a) d2.b = d2.a;
always @(b) d1.b = b;
endmodule
### Result:

# Verilog Code:
module SchedDelayA;
reg a, b;
initial
begin
end
always @(b) a = b;
always @(a) b <= a;
endmodule
### Vari