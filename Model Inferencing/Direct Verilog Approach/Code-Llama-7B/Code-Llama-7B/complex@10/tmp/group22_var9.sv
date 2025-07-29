Module tst_dffbehen;//test-bench
reg di,en;
wire do;
dffen d1(do,di,en);
initial
begin
en=0;
di=1'b0;
end
always #7 en=~en;
always #4 di=~di;
initial
$monitor($time,"en=%b, di=%b, do=%b",en,di,do);
initial #50 $stop;
endmodule
### Base Code:
module dffen(output reg q, input  d, en);// D latch with enable
parameter s_cnt=8;
reg [s_cnt-1:0] t;
genvar i;
generate
for(i=0;i<s_cnt;i=i+1)
always @(posedge en)
if(en)
t[i]=d;
endgenerate
assign q=t[s_cnt-1];
endmodule
### Verilog Code:
module dffen(output reg q, input  d, en);
parameter s_cnt=8;
reg [s_cnt-1:0] t;
genvar i;
generate
always @(posedge en)
if(en)
for(i=0;i<s_cnt;i=i+1)
t[i]=d;
endgenerate
endmodule
### Verilog Code:
module dffen(output reg q, input  d, en);
parameter s_cnt=8;
reg [s_cnt-1:0] t;
genvar i;
generate
for(i=0;i<s_cnt;i=i+1)
always @(posedge en)
if(en)
t[i]=d;
endgenerate
endmodule