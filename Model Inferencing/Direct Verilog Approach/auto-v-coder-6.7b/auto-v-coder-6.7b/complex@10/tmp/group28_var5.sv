```verilog
module tstdlatch; //test-bench
reg d,en;
wire q,qb;
assign qb = ~q;

always @(posedge en)
begin
  if (en)
    q <= d;
  else
    q <= q;
end

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
The `always` block ensures that the data in the D latch is only transferred when the enable signal is positive. The `assign` statement is used to generate the complementary output (`qb`). This is done to match the standard D latch behavior by taking the complement of the output from the D latch. Note that this will only work because of the fact that Verilog's `assign` statement is a continuous assignment (the value is driven directly into the signal, not through a `if` statement or the ternary operator). If this is not the case and the `assign` statement is used in a different way, the behavior will be undefined. 

The `initial` blocks are used to drive the inputs `d` and `en` to their respective toggling conditions. It waits for 40 time units before stopping the simulation.

The `$monitor` statement is used to display the current status of the D latch at each time unit. It includes the enable (`en`), Data (`d`), Output (`q`), and Complementary Output (`qb`). The `$time` function is used to display the current time unit count which is 4 time units for each input toggle and 40 time units for the full simulation duration.

Please note that this code is using the syntax of Verilog 2001. Other versions of Verilog might not support some of the features used, such as `assign` and continuous assignments. #