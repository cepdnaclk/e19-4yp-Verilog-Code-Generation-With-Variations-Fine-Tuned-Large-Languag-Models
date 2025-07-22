module tst_dffben;//test-bench
reg di,en;
wire do;
dffen d1(do,di,en); // Instantiate the D latch

//add inside operator check
integer s_maxcnt=7;//max number of loops for inside checking
integer s_cnt=0;//initialize the check counter
generate
always //wrap the block inside generate block
begin
if(~en)//en=0,do=0
begin
s_cnt=0;
end
else
begin
s_cnt=s_cnt+1;//if within the constant array, do nothing; otherwise check inside the array
if(s_cnt==s_maxcnt)//reset the counter when s_cnt is more than s_maxcnt
begin
s_cnt=0;
end
end
end
endgenerate

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
### Output:
en=1, di=0, do=0
en=1, di=0, do=1
en=1, di=0, do=0
en=1, di=0, do=1
en=1, di=0, do=0
en=1, di=0, do=1
en=1, di=0, do=0
en=1, di=0, do=1
en=1, di=0, do=0
en=1, di=0, do=1
en=1, di=0, do=0
en=1, di=0, do=1
en=1, di=0, do=0
en=1, di=0, do=1
en=1, di=0, do=0
en=1, di=0, do=1
en=1, di=0, do=0
en=1, di=0, do=1
en=1, di=0, do=0
en=1, di=0, do=1
en=1, di=0, do=0
en=1, di=0, do=1
en=1, di=0, do=0
en=1, di=0, do=1
en=1, di=0, do=0
en=1, di=0, do=1
en=1, di=0, do=0
en=1, di=0, do=1
en=0, di=0, do=0
en=0, di=0, do=0
en=0, di=0, do=0
en=0, di=1, do=0
en=0, di=1, do=1
en=1, di=1, do=1
en=1, di=1, do=1
en=1, di=1, do=1
en=1, di=1, do=1
en=1, di=1, do=1
en=1, di=1, do=1
en=1, di=1, do=1
en=1, di=1, do=1
en=1, di=1, do=1
en=1, di=1, do=1
en=1, di=1, do=1
en=1, di=1, do=1
en=1, di=1, do=1
en=1, di=1, do=1
en=1, di=1, do=1
en=1, di=1, do=1
en=1, di=1, do=1
en=1, di=1, do=0
en=1, di=1, do=0
en=1, di=1, do=0
en=1, di=1, do=0
en=1, di=1, do=0
en=1, di=1, do=0
en=1, di=1, do=0
en=1, di=1, do=0
en=1, di=1, do=0
en=1, di=1, do=0
en=1, di=1, do=0
en=1, di=1, do=0
en=1, di=1, do=0
en=1, di=1, do=0
en=1, di=1, do=0
en=1, di=1, do=0
en=1, di=1, do=0
en=1, di=1, do=0
en=1, di=1, do=0
en=1, di=1, do=0
en=1, di=1, do=0
en=1, di=1, do=0
en=1, di=1, do=0
en=1, di=1, do=0
en=1, di=1, do=0
en=1, di=1, do=0
en=1, di=1, do=0
en=1, di=1, do=0
en=1, di=1, do=0
en=1, di=1, do=0
en=1, di=1, do=0
en=1, di=1, do=0
en=1, di=1, do=0
en=1, di=1, do=0
en=1, di=1, do=0
en=1, di=1, do=0
en=1, di=1, do=0
en=1, di=1, do=0
en=1, di=1, do=0
en=1, di=1, do=0
en=1, di=1, do=0
en=1, di=1, do=0
en=1, di=1, do=0
en=1, di=1, do=0
en=1, di=1, do=0
en=1, di=1, do=0
en=1, di=1, do=0
en=1, di=1, do=0
en=1, di=1, do=0
en=1, di=1, do=0
en=1, di=1, do=0
en=1, di=1, do=0
en=1, di=1, do=0
en=1, di=1, do=0
en=1, di=1, do=0
en=1, di=1, do=0
en=1, di=1, do=0
en=1, di=1, do=0
en=1, di=1, do=0
en=1, di=1, do=0
en=1, di=1, do=0
en=1, di=1, do=0
en=1, di=1, do=0
en=1, di=1, do=0
en=1, di=1, do=0
en=1, di=1, do=0
en=1, di=1, do=0
en=1, di=1, do=0
en=1, di=1, do=0
en=1, di=1, do=0
en=1, di=1, do=0
en=1, di=1, do=0
en=1, di=1, do=0
en=1, di=1, do=0
en=1, di=1, do=0
en=1, di=1, do=0
en=1, di=1, do=0
en=1, di=1, do=0
en=1, di=1, do=0
en=1, di=1, do=0
en=1, di=1, do=0
en=1, di=1, do=0
en=1, di=1, do=0
en=1, di=1, do=0
en=1, di=1, do=0
en=1, di=1, do=0
en=1, di=1, do=0
en=1, di=1, do=0
en=1, di=1, do=0
en=1, di=1, do=0
en=1, di=1, do=0
en=1, di=1, do=0
en=1, di=1, do=0
en=1, di=1, do=0
en=1, di=1, do=0
en=1, di=1, do=0
en=1,