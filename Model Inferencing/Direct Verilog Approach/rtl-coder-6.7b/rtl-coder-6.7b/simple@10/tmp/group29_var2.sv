module SchedDelayA;
reg a, b;
class c;
reg b;
endclass
c lut[*];
initial
begin
end
always @(b) a = b;
always @(a) lut[a].b <= a;
endmodule
### Output:
|a|b
|0|0
|0|0
|1|1