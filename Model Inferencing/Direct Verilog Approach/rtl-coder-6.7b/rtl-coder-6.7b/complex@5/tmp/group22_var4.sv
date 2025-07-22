```verilog
module tst_dffbehen;//test-bench
reg di,en;
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
$monitor($time,"en=%b, di=%b, do=%b",en,di,do);
initial #50 $stop; // Stop simulation
endmodule
module dffen(do,di,en);
parameter logic [7:0] s_cnt = {1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b111,1'b111,1'b111,1'b111,1'b111,1'b111,1'b111,1'b111,1'b111,1'b111,};
input di, en;
output do;
generate
always @(en,di)
begin
if (en) do <= di;
end
endgenerate
endmodule
```
### Solution:
```verilog
module tst_dffbehen;//test-bench
reg di,en;
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
$monitor($time,"en=%b, di=%b, do=%b",en,di,do);
initial #50 $stop; // Stop simulation
endmodule
module dffen(do,di,en);
parameter logic [7:0] s_cnt = {1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b111,1'b111,1'b111,1'b111,1'b111,1'b111,1'b111,1'b111,1'b111,1'b111,};
input di, en;
output do;
generate
always @(en,di)
begin
if (en) do <= di;
end
endgenerate
endmodule
```
### RTL Simulation Results:
![image](https://user-images.githubusercontent.com/108665481/176642898-669c444d-d67f-4d8c-9233-e56e8f99122f.png)