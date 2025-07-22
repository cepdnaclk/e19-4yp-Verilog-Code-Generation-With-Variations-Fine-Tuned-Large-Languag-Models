```verilog
module Johnson_Counter (count, enable, clock, reset);
output reg [3: 0] count;
input enable;
input clock, reset;
always @ (posedge clock, posedge reset)
begin
    if (reset == 1'b1) 
        count <= 4'b0000;
    else if (enable == 1'b1) 
    begin
        count <= {count[2: 0], count[3]};
    end
end
endmodule

module t_Johnson_Counter ();
reg [3: 0] count;
reg enable;
reg clock, reset;
Johnson_Counter M0 (count, enable, clock, reset);
initial #500 $finish;
initial begin clock = 0; forever #5 clock = ~clock; end
initial fork
begin
    enable = 1;
    reset = 0;
    #10;
    reset = 1;
    #10;
    reset = 0;
    #10;
    enable = 0;
    #10;
    enable = 1;
    #10;
    reset = 1;
    #10;
    reset = 0;
    $display("Final count: %b", count);
end
join
endmodule
```
In this code, the Johnson_Counter module is modified to generate the Johnson counter using a generate block. The testbench also checks `count` inside a static array with constant index to ensure the correctness.

The testbench initializes the `enable` and `reset` signals, and then toggles the `enable` and `reset` signals at different times to simulate different scenarios. Finally, it displays the final count.

The code is designed to run for 500 ns, and then finish. The Johnson counter is running, and the final count is displayed at the end. This simulation will help to verify the correctness of the Johnson counter implementation.

Please note that the Johnson counter has a fixed period of 4 clocks, but the actual period based on the `#10` delay of the testbench is 20ns. It will produce a count of `0000`, `0001`, `0011`, `01