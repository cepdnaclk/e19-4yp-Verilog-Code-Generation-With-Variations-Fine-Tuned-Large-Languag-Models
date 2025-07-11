```verilog
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
initial $monitor($time," en = %b, d = %b, q = %b, qb = %b ", en,d,q,qb);
initial #40 $stop;
endmodule
```
The above Verilog code is a simple test-bench for a D latch. It toggles the data and enables every 4 and 8 time units respectively. The outputs are then monitored in the $monitor statement. After 40 time units, the simulation ends.

It is important to note the function of the test-bench. It is a way to probe the design under test to ensure that it works as expected. It does not perform any actual functional verification of the D latch itself. To do that, you would need additional code in the same module which tests the D latch logic. This variation instruction is not applicable because the original code does not have any logic to be modified. It is written as "replace".###                                                                                                                                                                                          