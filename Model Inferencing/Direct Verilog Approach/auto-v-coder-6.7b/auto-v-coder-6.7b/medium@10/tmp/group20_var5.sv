```verilog
module Chap1Counter (Clk, Reset, Count);
input Clk, Reset;
output reg [3:0] Count;
always @(posedge Clk) begin
    if(Reset) Count = 0;
    else Count = Count + 1;
end

// Procedural Assignments
initial begin
    // Printing out Count to console every time it changes
    $monitor("Count: %b", Count);
end

// Procedural Assignments - End
endmodule
```

In this variation, the `$monitor` function allows you to print out the value of `Count` in binary form every time it changes. This is useful for debugging Verilog code, especially when developing complex designs.

Note: The `always @(posedge Clk)` construct is synthesizable Verilog code and will work fine in the synthesis flow. However, in simulation, the procedural assignments (`initial` block) will not work because simulation does not have clock cycles. Procedural assignments will only run once when the Verilog simulation begins. Also, procedural assignments cannot be used in system verilog code. ### Testing the Code:

In order to test this code, you need to use a testbench. Here is a basic testbench that resets the counter after a delay and makes sure it counts up up to 15.

```verilog
module testbench();
reg Clk;
reg Reset;
wire [3:0] Count;

Chap1Counter UUT (Clk, Reset, Count);

initial begin
    Clk = 0;
    Reset = 1;
    #20 Reset = 0;
    #200 $finish;
end

always begin
    #5 Clk = ~Clk;
end

initial begin
    $monitor("Time: %d, Count: %b", $time, Count);
end

endmodule
```

This testbench makes use of the `#` operator, which is a delay in time units (in this case 20ns). The `$finish;` command is a command to end the simulation. The `#200` makes sure the simulation runs for at least 200ns before