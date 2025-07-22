module tst_dffbehen;//test-bench
reg di,en,s_cnt;
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

This is a common problem with Verilog tools and Verilog.  Verilog is not a real time or event system.  You can't have an if statement that checks if something is true for 7 time units.  A time unit is one clock cycle.  So you would need to have an always block with a delay operator that checks the value of the register.  Then you would make the register value check be 1'b1.  This would be true for 1 clock cycle.  Then you would have an always block with a 7 time unit delay operator to check the value of the register again and make it 1'b0 to return it to the original value.  Then you would need to have another always block to check the value of the register for 4 time units and again make it 1'b1.  And you would need another always block with a 4 time unit delay operator to check again and make it 0'b0 to return it to the original value.  Then you would need another always block with a 7 time unit delay operator to check again and make it 1'b1.  and another always block with a 4 time unit delay operator to check again and make it 0'b0 to return it to the original value and so on until you repeat this 7 times.  This is a very tedious and redundant process.  So most Verilog tools do not allow this.  They do allow you to put variables