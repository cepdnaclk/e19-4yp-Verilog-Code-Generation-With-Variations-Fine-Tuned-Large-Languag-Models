module d_ffen(outp,inputp,enable);
reg inputp;
reg [2:0] s_cnt;
wire en;
assign en=enable;
reg outp;
always@(inputp,en)
begin
if(~en)
begin
outp=inputp;
end
if(en)
begin
s_cnt<=s_cnt+1;
if(s_cnt[2:0]==3'b111)
begin
s_cnt<=1;
end
end
if(~en)
begin
outp=inputp;
end
end
ifndef SIM
assume (do==s_cnt[2:0])
else // use default do output
assign do = outp;
endmodule
module tst_dfffifndef;//test-bench
reg di,en;
wire do;
d_ffen d1(do,di,en); // Instantiate the D latch
initial
begin
en=0; // Latch initially disabled (opaque)
di=1'b0; // Initial data
end
always #7 en =~en; // Toggle enable every 7 time units
always #4 di=~di; // Toggle data every 4 time units
initial
$monitor($time,"en=%b, di=%b, do=%b",en