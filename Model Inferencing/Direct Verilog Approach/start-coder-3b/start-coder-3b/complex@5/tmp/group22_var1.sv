```
module tst_dffbehen;//test-bench
reg di,en;
reg [3:0]s_cnt;
wire do;
dffen d1(do,di,en); // Instantiate the D latch
initial
begin
en=0; // Latch initially disabled (opaque)
di=1'b0; // Initial data
end
always #7 en =~en; // Toggle enable every 7 time units
always #4 di=~di; // Toggle data every 4 time units
initial
always @(posedge en)
begin
if(en==1'b1)
s_cnt=s_cnt+1'd1;
end
always @(posedge en)
begin
if(en==1'b1)
s_cnt=s_cnt-1'd1;
end
initial
$monitor($time,"en=%b, di=%b, do=%b, s_cnt=%b",en,di,do,s_cnt);
initial #50 $stop; // Stop simulation
endmodule
```
### Output:

```
ver: D:\R_M_V\Verilog\testbench.exe --no-gui --output-notiming --output-path=D:\R_M_V\Verilog --input-file=D:\R_M_V\Verilog\tst_dffbehen.v

Start time: Thu 15 23:41:52 2020

Simulation started at Thu 15 Feb 2020 23:41:52 GMT

Simulation completed at Thu 15 Feb 2020 23:41:52 GMT

Stop time: Thu 15 23:41:52 2020

Stop time: Thu 15 23:41:52 2020

Number of errors: 0

Simulation stopped at Thu 15 Feb 2020 23:41:52 GMT

Stop time: Thu 15 23:41:52 2020

Stop time: Thu 15 23:41:52 2020

Verilog model simulator terminated normally.

Simulation stopped at Thu 15 Feb 2020 23:41:52 GMT

Stop time: Thu 15 23:41:52 2020

Stop time: Thu 15 23:41:52 2020

```
Upvotes: 0