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
```
### Combinational Block:
```verilog
module dffen(
	output out,
	input en,
	input x
);
wire [3:0] s_cnt=[{8{en}}];
wire [7:0] y=x;
wire [7:0] z;
reg o;
assign z=x;
always @(s_cnt)
begin
if(inside(s_cnt,[8'h01,8'h02,8'h04,8'h08,8'h10,8'h20,8'h40,8'h80]))
begin
o<=~o;
end
end
assign out=o;
endmodule
```
### Test Bench Output:
```
time:100 en=1'b0, di=1'b0, do=1'bx
time:110 en=1'b1, di=1'b1, do=1'bx
time:114 en=1'b0, di=1'b1, do=1'bx
time:124 en=1'b1, di=1'b0, do=1'bx
time:134 en=1'b0, di=1'b0, do=1'bx
time:144 en=1'b1, di=1'b1, do=1'bx
time:154 en=1'b0, di=1'b1, do=1'bx
time:164 en=1'b1, di=1'b0, do=1'bx
time:174 en=1'b0, di=1'b0, do=1'bx
time:184 en=1'b1, di=1'b1, do=1'bx
time:194 en=1'b0, di=1'b1, do=1'bx
time:204 en=1'b1, di=1'b0, do=1'bx
time:214 en=1'b0, di=1'b0, do=1'bx
time:224 en=1'b1, di=1'b1, do=1'bx
time:234 en=1'b0, di=1'b1, do=1'bx
time:244 en=1'b1, di=1'b0, do=1'bx
time:254 en=1'b0, di=1'b0, do=1'bx
time:264 en=1'b1, di=1'b1, do=1'bx
time:274 en=1'b0, di=1'b1, do=1'bx
time:284 en=1'b1, di=1'b0, do=1'bx
time:294 en=1'b0, di=1'b0, do=1'bx
time:304 en=1'b1, di=1'b1, do=1'bx
time:314 en=1'b0, di=1'b1, do=1'bx
time:324 en=1'b1, di=1'b0, do=1'bx
time:334 en=1'b0, di=1'b0, do=1'bx
time:344 en=1'b1, di=1'b1, do=1'bx
time:354 en=1'b