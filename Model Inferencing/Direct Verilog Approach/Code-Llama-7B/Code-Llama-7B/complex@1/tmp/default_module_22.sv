module tst_dffbehen ;

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
initial begin
repeat(5) @(posedge clk);
  for(int j=0;j<4;j++) begin
   inside(j,{0,2,3});
   if(do[j]==1'b0) $display("%dth latch is set (en=%b,di=%b);",j,en,di);
   else $display("%dth latch is clear (en=%b,di=%b);",j,en,di);
  end
end
### Expected Result:
Output: