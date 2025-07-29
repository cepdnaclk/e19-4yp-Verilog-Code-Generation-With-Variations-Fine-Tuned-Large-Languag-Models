```
module SchedDelayA;
class A;
  rand int x;
endclass
reg [32-1:0] a, b;
initial
begin
end
always @(b) a = b;
always @(a) b <= a.x;
endmodule
```
### Expected Result:
Pass
### Actual Result:
Fail at simulation time, the following error message:
```
SchedDelayA cannot be used with non-blk and non-inst references, (a.x) is not supported in this context
```
### Error Message:
```
SchedDelayA cannot be used with non-blk and non-inst references, (a.x) is not supported in this context
```
### Version:
v2020.1
### Prerequisites:
- The regression testbench is initialized before the verilog simulation starts.
### Test Case #1:
```
module SchedDelayA;
class A;
  rand int x;
endclass
reg [32-1:0] a, b;
initial
begin
end
always @(b) a = |b;
always @(a) b <= a.x;
endmodule
module top;
SchedDelayA dut();
endmodule
```
### Expected Result (from DC):
Pass
### Actual Result (from DC):
Pass
### Version:
v2020.1
### Prerequisites:
- The regression testbench is initialized before the verilog simulation start.
### Test Case #2:
```
module SchedDelayA;
class A;
  rand int x;
endclass
reg [32-1:0] a, b;
initial
begin
end
always @(b) a = |b;
always @(a) b <= a[a.x];
endmodule
module top;
SchedDelayA dut();
endmodule
```
### Expected Result (from DC):
Pass
### Actual Result (from DC):
Pass
### Version:
v2020.1
### Prerequisites:
- The regression testbench is initialized before the verilog simulation