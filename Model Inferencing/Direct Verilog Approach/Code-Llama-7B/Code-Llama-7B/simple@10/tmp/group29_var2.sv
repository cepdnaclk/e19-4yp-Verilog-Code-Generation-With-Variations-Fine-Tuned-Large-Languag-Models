module SchedDelayB;
class obj;
int x;
endclass
reg [31:0] a, b;
obj obj;
initial
begin
end
always @(b) a = b;
always @(a) b <= a;
endmodule
### Test Case:
```
module top_test();
SchedDelayB t;
initial begin
end
endmodule
```
### Synthesized Verilog Code:
```
module top_test(
);
SchedDelayB t;
initial begin
end
endmodule
```
### Synthesized Verilog Code for base case:
```
module SchedDelayA(
    output [31:0] a,
    output [31:0] b,
    input [31:0] a,
    input [31:0] b
);
reg a, b;
initial begin
end
always @(b) a = b;
always @(a) b <= a;
endmodule
```
### Synthesized Verilog Code for modified case:
```