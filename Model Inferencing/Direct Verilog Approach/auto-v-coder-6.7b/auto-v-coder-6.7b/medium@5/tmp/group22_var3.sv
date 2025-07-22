```verilog
`define MON_START 0
`define MON_INTERVAL 2
`define MON_END 6

module nil;
reg [3:0] a;
initial 
begin
a = 4'b0001;
$display ("t=%0t display: a = %b", $time, a); // Added time
end

always @(posedge a[1]) 
begin 
    if ((`MON_START <= $time) && ($time < `MON_END))
    begin
        $display ("t=%0t monitor: a = %b", $time, a);
    end
end

initial 
begin #1;
$monitor("t=%0t monitor: a = %b", $time, a);
end
// Monitor triggers at t=0, t=2, t=5, t=6
endmodule
```

The `always` block triggers when the posedge of the 2nd bit(a[1]) of the 4-bit register 'a' occurs. Inside that block, we check the time condition and display the value of 'a' only if it satisfies the condition. This is a way of using `$monitor` inside a `always` block.

The `$monitor` is also used to display values of `a` at times when the posedge of the 2nd bit(a[1]) of the 4-bit register 'a' occurs but only for the first `MON_INTERVAL` clock cycles. It triggers from `MON_START` to the next time when the posedge of the 2nd bit(a[1]) of the 4-bit register 'a' occurs. 

In this example, `MON_START = 0`, `MON_INTERVAL = 2`, and `MON_END = 6` and the bit is changed at time `MON_START = 0`. `MON_INTERVAL = 2`, and `MON_END = 6`. The monitor should display values of 'a' from time 0 to time 2. Then no more monitor output will be displayed.

Please note that, the time value `$time` is always of type `real` and this is why it is used in the conditional expression.