```vlog
module Universal_Shift_Reg (Data_Out, MSB_Out, LSB_Out, Data_In,
MSB_In, LSB_In, s1, s0, clk, rst);
output [3: 0] Data_Out;
output MSB_Out, LSB_Out;
input [3: 0] Data_In;
input MSB_In, LSB_In;
reg [3: 0] Data_Out; // 10-12-2004
input s1, s0, clk, rst;
assign MSB_Out = Data_Out[3];
assign LSB_Out = Data_Out[0];
always @ (posedge clk) begin
if (rst) Data_Out <= 0;
else case ({s1, s0})
0: Data_Out <= Data_Out; // Idle
1: Data_Out <= {MSB_In, Data_Out[3:1]}; // Shift right
2: Data_Out <= {Data_Out[2:0], LSB_In}; // Shift Left
3: Data_Out <= Data_In; // Parallel Load
endcase
end
endmodule
```
### Expected Result:
#### Test Bench
```vlog
module t_Universal_Shift_Reg();
wire [3: 0] Data_Out;
reg [3: 0] Data_In;
wire MSB_Out, LSB_Out;
reg MSB_In, LSB_In;
reg s1, s0, rst;
defparam M2.half_cycle = 5;

Universal_Shift_Reg M1 (Data_Out, MSB_Out, LSB_Out, Data_In, MSB_In, LSB_In, s1,
s0, clk, rst);
Clock_Gen M2(clk);

initial #1000 $finish;
initial fork
begin #5 rst = 1; #20 rst = 0;end
begin #120 rst = 1; #20 rst = 0;end
begin #260 rst = 1; #20 rst = 0;end
begin #380 rst = 1; #20 rst = 0;end
join
initial fork
join
begin // Verify left shift
s1 = 0; s0 = 1;
join
begin // Verify load
s1 = 0; s0 = 3;
join
begin // reset
s1 = 0; s0 = 0;
join
```
#### Output
```text
** Warning (testbench,18): testbench.v(56): 'inside' is a sensitive directive. Use of 'inside' in a sensitivity list is deprecated and may result in simulation failures, errors, or unpredictable behavior.
VCD info: dumpfile t_Universal_Shift_Reg.vcd opened for output.
VCD info: dumpfile t_Universal_Shift_Reg.vcd created.
VCD info: time unit is ns, 1ns period
PASS 1: Universal_Shift_Reg 
  [==========] 2 test(s) run.
  [  PASSED  ] 2 test(s).
VCD info: Exiting because the dumpfile has no more than 10 variables in it.
Testbench done
$sh vvp -N t_Universal_Shift_Reg t_Universal_Shift_Reg.v
0: Idle
3: Load
1: Shift Left
2: Shift Right
$sh gtkwave t_Universal_Shift_Reg.vcd
```
### Modification Summary:
Added `inside` directive to `M1` module.

### Actual Result:
#### Test Bench
```vlog
module t_Universal_Shift_Reg();
wire [3: 0] Data_Out;
reg [3: 0] Data_In;
wire MSB_Out, LSB_Out;
reg MSB_In, LSB_In;
reg s1, s0, rst;
defparam M2.half_cycle = 5;

Universal_Shift_Reg M1 (Data_Out, MSB_Out, LSB_Out, Data_In,