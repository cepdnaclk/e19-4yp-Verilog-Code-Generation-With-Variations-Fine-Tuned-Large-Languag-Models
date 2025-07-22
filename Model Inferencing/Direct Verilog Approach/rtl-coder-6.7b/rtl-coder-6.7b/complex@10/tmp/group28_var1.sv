```systemverilog
module tstdlatch; //test-bench
reg d,en;
wire q,qb;
// dlatch ff(en,d,q,qb); // Assuming instantiation of a D latch module
initial
begin
d = 1'b0;
en = 1'b0; // Latch disabled
end
always #4 en =~en; // Enable toggles every 4 time units
always #8 d=~d; // Data toggles every 8 time units
parameter p1 = 1, p2 = 0;
initial
begin
$monitor($time," en = %b, d = %b, q = %b, qb = %b ", en,d,q,qb);
 if(en==p1)
   if(state==p1)
    
   else
     
initial #40 $stop;
end
endmodule
```