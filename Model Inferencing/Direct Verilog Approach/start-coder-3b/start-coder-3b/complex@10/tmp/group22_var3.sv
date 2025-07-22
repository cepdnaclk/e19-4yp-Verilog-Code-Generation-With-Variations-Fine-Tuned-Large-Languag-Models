module tst_dffbehen;//test-bench
reg di,en;
wire do;
dffen d1(do,di,en); // Instantiate the D latch

initial
begin
en=0; // Latch initially disabled (opaque)
di=1'b0; // Initial data
s_cnt=0;
end
always #7 en =~en; // Toggle enable every 7 time units
always #4 di=~di; // Toggle data every 4 time units

// generate block
for (gen_cnt=0;gen_cnt<10;gen_cnt=gen_cnt+1)
begin
$monitor($time,"en=%b, di=%b, do=%b, s_cnt=%b",en,di,do,s_cnt);
end

initial #50 $stop; // Stop simulation
endmodule

• This looks great, but I'm still getting errors with the generated code (I'm using Xilinx's Vivado 2019.1). The generated code runs fine, but the Vivado GUI gives several "cannot process generate block" errors and several "cannot find symbol" errors. Nov 19 '19 at 21:41
• @RobertDriscoll I just pushed a small change to demonstrate the code. The only time it will error is if the "en" and "do" wires in the generate block aren't connected (i.e. the wire doesn't exist in the module). Nov 19 '19 at 22:21
• You are right, now it works - I was only getting the error when not connected to the `do` wire, which is why I missed it. Just a matter of figuring out how to disable the generate block in the GUI. Nov 19 '19 at 22:26
• @RobertDriscoll The "cannot process generate block" error occurs when the generate block is completely empty (as in my case, there is no code in the generate block). Nov 20 '19 at 2:56
• @RobertDriscoll I just pushed a small change to demonstrate the code. The only time it will error is if the "en" and "do" wires in the generate block aren't connected (i.e. the wire doesn't exist in the module). Nov 19 '19 at 22:21