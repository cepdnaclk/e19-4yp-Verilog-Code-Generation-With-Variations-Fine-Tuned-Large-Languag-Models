```verilog
interface IFC;
wire s, r;
const string str1 = "string1";
modport MP1 ( input s, r,
              output q );
endinterface
```
```verilog
module d_ff (input d, clk, s, r, output reg q, q_b );
always @( inside {str1} ) begin : force_a_1
if ( s )
begin
end else begin
deassign q;
deassign q_b;
end
end
always @( r ) begin : force_a_0
if( r )
begin
end else begin
deassign q;
deassign q_b;
end
end
always @( posedge clk ) begin : clocked
end
endmodule
```
### Expected Output:
```verilog
Error: (vlog-13069) Illegal reference to "d_ff". It should only appear as a module path.
    Time: 0 ps  Iteration: 0  Instance: /d_ff/0
Error: (vlog-13205) $fopen failed.
    Time: 0 ps  Iteration: 0  Instance: /d_ff/0
Error: (vlog-13069) Illegal reference to "d_ff". It should only appear as a module path.
    Time: 0 ps  Iteration: 0  Instance: /d_ff/0
Error: (vlog-13205) $fopen failed.
    Time: 0 ps  Iteration: 0  Instance: /d_ff/0
```
### Actual Output:
```verilog
Error: (vlog-13069) Illegal reference to "d_ff". It should only appear as a module path.
    Time: 0 ps  Iteration: 0  Instance: /d_ff/0
Error: (vlog-13205) $fopen failed.
    Time: 0 ps  Iteration: 0  Instance: /d_ff/0
Error: (vlog-13069) Illegal reference to "d_ff". It should only appear as a module path.
    Time: 0 ps  Iteration: 0  Instance: /d_ff/0
Error: (vlog-13205) $fopen failed.
    Time: 0 ps  Iteration: 0  Instance: /d_ff/0
```
## Pass the Testcase

### Pre-Condition:
- Load _d_ff.v_ to the project
- Add _d_ff.v_ to the compilation unit
- Add _d_ff_tb.v_ to the compilation unit
- Add _d_ff_tb.v_ to the elaboration call
- Open the transcript tab of the project
### Step1:
- Add interface `IFC` to _d_ff_tb.v_
### Step2:
- Add interface instantiation to _d_ff.v_
### Step3:
- Add interface port connection to _d_ff_tb.v_

### Run the testcase

```verilog
module d_ff_tb();
wire d, q;
d_ff DUT (
.d(d),
.clk(clk),
.s(s),
.r(r),
.q(q),
.q_b(q_b)
);
reg  clk = 0;
reg  d = 0;
reg  s = 0;
reg  r = 0;
reg  q = 0;
reg  q_b = 0;
initial begin
$monitor("%d", q);
end
always begin
#5;
clk = ~clk;
d = 0;
s = 0;
r = 0;
#10
s = 1;
#10
s = 0;
r = 1;
#5
r = 0;
#10
s = 1;
#10
s = 0;
r = 1;
#5
r = 0;
#10
s = 1;
#10
s = 0;
r = 1;
#5
r = 0;
#10
s = 1;
#10