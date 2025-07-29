```
module tst_cntbehen;
reg clk;
reg rst;
reg [2:0] s_cnt;
wire [2:0] cnt;
integer i;
parameter SCLK_PERIOD_NS = 40;
parameter T_MAX = 4;

generate

generate for(i=0;i<3;i=i+1) begin:gen_dffs
	dff #(.T_MAX(T_MAX)) u_dff(.q(cnt[i]),.d(s_cnt[i]),.clk(clk),.rst(rst));
end:gen_dffs

endgenerate

initial begin
clk=0;
forever #(SCLK_PERIOD_NS/2) clk=~clk;
end

initial begin
rst=0;
#10
rst=1;
#50 rst=0;
end

initial begin
s_cnt=0;
s_cnt=3'b101;
end

always @(posedge clk) begin
end

initial
$monitor($time,"clk=%b, rst=%b, s_cnt=%b, cnt=%b",clk,rst,s_cnt,cnt);
endmodule

module dff # (
parameter T_MAX=1
)
(
input reg clk,
input reg rst,
input reg d,
output reg q
);
reg [T_MAX-1:0]s;
always @ (posedge clk or rst) begin
if (rst==1) begin
s<=0;
q<=0;
end
else begin
if(s==T_MAX-1) begin
q<=d;
s<=0;
end
else begin
s<=s+1;
end
end

end
endmodule
```
### Dump Logic Equivalence Vectors:
- [Dump LV](https://github.com/Knowledge-Precipitation-Tribe/Verilog-Code/blob/main/dffbehen/dff%20d_0_v.lis.txt)
- [Dump LV after escaping module](https://github.com/Knowledge-Precipitation-Tribe/Verilog-Code/blob/main/dffbehen/dff%20d_0_v_esc.lis.txt)
### Results
- The input and output of LV are same when `d` is not a constant value in LV.
- The input and output of LV are same after escaping module.
- The LV and LV after escaping module are same.

### Discussion
The LV after escaping module is the result we want.

### Reference
- [Dump LV](https://github.com/Knowledge-Precipitation-Tribe/Verilog-Code/blob/main/dffbehen/dff%20d_0_v.lis.txt)
- [Dump LV after escaping module](https://github.com/Knowledge-Precipitation-Tribe/Verilog-Code/blob/main/dffbehen/dff%20d_0_v_esc.lis.txt)
- [Base Verilog Code](https://github.com/Knowledge-Precipitation-Tribe/Verilog-Code/blob/main/dffbehen/dffbehen.v)
- [Variation Instruction](https://github.com/Knowledge-Precipitation-Tribe/Verilog-Code/blob/main/dffbehen/dffbehen_v.v)
- [Modified Code](https://github.com/Knowledge-Precipitation-Tribe/Verilog-Code/blob/main/dffbehen/dffbehen_v_esc.v)

## 4. D-Latch
### Base Verilog Code:
```
module tst_dffdhen;//test-bench
reg di,en;
wire do;
dff d1(do,di,en); // Instantiate the D latch
initial
begin
en=0; // Latch initially disabled (opaque)
di=1'b0; // Initial data
end
always #7 en =~en; // Toggle enable