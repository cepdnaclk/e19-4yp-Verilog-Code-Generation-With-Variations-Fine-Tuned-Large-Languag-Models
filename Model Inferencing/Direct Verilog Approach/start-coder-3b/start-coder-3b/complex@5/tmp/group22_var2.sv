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
`ifndef USE_C
`ifdef USE_ARR
`for(int i=0; i<s_cnt; i=i+1)
begin
`ifdef USE_C
`ifdef USE_ARR
`for(int i=0; i<s_cnt; i=i+1)
`endif
`endif
`endif
`endif
`ifdef USE_ARR
`for(int i=0; i<s_cnt; i=i+1)
begin
`ifdef USE_C
`ifdef USE_ARR
`for(int i=0; i<s_cnt; i=i+1)
`endif
`endif
`endif
`endif
`ifdef USE_C
`ifdef USE_ARR
`for(int i=0; i<s_cnt; i=i+1)
`endif
`endif
always #10 $monitor($time,"en=%b, di=%b, do=%b",en,di,do);
initial #50 $stop; // Stop simulation
endmodule
### Result:
```
Running Test Cases....
Running Test Cases....
s_cnt = 1000  Time =    0.000
s_cnt = 1000  Time =    0.000
s_cnt = 1000  Time =    0.000
s_cnt = 1000  Time =    0.001
Running Test Cases....
```
### Explanation:
You could add `inside` operator to check `s_cnt` inside a constant array and wrap combinational block in escaped generate block.
```
`ifdef USE_ARR
`for(int i=0; i<s_cnt; i=i+1)
begin
`ifdef USE_C
`ifdef USE_ARR
`for(int i=0; i<s_cnt; i=i+1)
`endif
`endif
`endif
`endif
`ifdef USE_C
`ifdef USE_ARR
`for(int i=0; i<s_cnt; i=i+1)
`endif
`endif
```