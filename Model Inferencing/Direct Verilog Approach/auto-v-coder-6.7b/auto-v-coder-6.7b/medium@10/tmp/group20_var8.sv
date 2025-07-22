```verilog
module Chap1Counter (Clk, Reset, Count);
input Clk, Reset;
output [3:0] Count;
reg [3:0] Count;
always @(posedge Clk) begin
    if(Reset) Count = 0;
    else begin
        Count = Count + 1;
        if(Count == 10) begin // Assuming we have a counter range of 10
            Count <= 0;
            #100 $display("Count Reached 10, Value = 0");
        end
    end
end
endmodule
```
This variation will reset the counter to 0 when it reaches 10 and will print a message on the console. The `#100` delays the output by 100 time units. The `$display` command is used to print the current value of the counter to the console. This can be replaced with any desired behavior when the counter reaches 10. If no delay is required or an immediate action is desired, the `$display` command can be replaced with an `if` statement. Note that a time delay is necessary to allow enough time for reset to happen before the message is displayed.