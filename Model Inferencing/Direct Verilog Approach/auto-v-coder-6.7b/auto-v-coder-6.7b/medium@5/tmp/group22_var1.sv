```verilog
module part_select;

reg [15:0] memory [7:0];
wire [3:0] address;
wire [15:0] data;

always @(posedge clk) begin
    memory[address] <= data;
end

initial begin
    for (int i = 0; i < 8; i++) begin
        memory[i] = i;
    end

    address = 2;
    data = 16'bz1010;
    $display("Before clock edge t=%0t, memory[%d] = %h", $time, address, memory[address]);
    #1; // Delay for 1 time unit
    $display("After clock edge t=%0t, memory[%d] = %h", $time, address, memory[address]);
end

endmodule
```
The module part_select is designed to demonstrate the use of part-selects in a conditional expression. An array memory with 8 elements is declared, each 16-bit wide and having integer indices 7:0. The data signal is also declared as a 16-bit wide wire.

The always block is an event-driven block that executes upon a positive edge of the clock. This block assigns the value of data to the memory at the address specified.

The initial block is an initial block which simulates the initialization of the memory array. It then assigns a value to the variable address, data, and then checks the value before and after the clock edge. In the monitor, you can see the changes happening to the memory cell. The value for 'address' is 2 and 'data' is "z1010", so the value of'memory[2]' changes accordingly. #1 is used as a delay before the next $display command is executed, as the simulation time t = 1, which allows the change in'memory[2]' to be visible.

Note: The simulation tool used (e.g., Modelsim, GTKWave, etc.) must support disabling/enabling timestamps to view the effects of the $monitor command. Also, not all simulation environments may support the $monitor command.

This variation will help in understanding part-select and $monitor in Verilog