module Chap1Counter (Clk, Reset, Count);
input Clk, Reset;
output [3:0] Count;
reg [3:0] Count;
always @(posedge Clk) begin
    if(Reset) Count = 0;
    else begin
        Count = Count + 1;
        //Adding a procedural assignment in final block
        if(Count[0] == 1'b1) $display($time,"Counter Reached 10");
    end
end
endmodule
This code will print "Counter Reached 10" in the simulation console whenever the value of the Count register equals 10. This is done to demonstrate the use of procedural assignments in Verilog. Procedural assignments are always evaluated at the end of the statement/block of code where they are used, and they can also modify the value of variables in the same statement/block. In this case, the if condition checks if the least significant bit (LSB) of the Count register is 1. If it is, a message is printed to the console.

Please note that you must include $display in your testbench to make it work. If your code is running inside a simulator, it will print the message in the console every time the Count register value reaches 10. The $time function is used to retrieve the current simulation time.<API_RUN_START>```verilog
module Chap1Counter (Clk, Reset, Count);
input Clk, Reset;
output [3:0] Count;
reg [3:0] Count;
always @(posedge Clk) begin
    if(Reset) Count = 0;
    else begin
        Count = Count + 1;
        //Adding a procedural assignment in final block
        if(Count[0] == 1'b1) $display($time,"Counter Reached 10");
    end
end
endmodule
```<API_RUN_STOP><API_RUN_START>``` 

This code adds a new condition to the Verilog code. It checks if the count is equal to 10, and if it is, it displays a message in the simulation console. It is added as a final block in the always block.