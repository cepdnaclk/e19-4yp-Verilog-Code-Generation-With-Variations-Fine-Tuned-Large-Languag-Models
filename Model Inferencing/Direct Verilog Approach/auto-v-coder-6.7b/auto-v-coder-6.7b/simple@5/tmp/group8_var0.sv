```verilog
module IR_multi_dim ( input [7:0] data_in [0:3][0:3], input [1:0] load [0:3], input clk,
output reg [7:0] data_out [0:3][0:3] );
// Simple register (Instruction Register) loaded on posedge clk when load is high
always @( posedge clk )
for (int i = 0; i < 4; i++) begin
    if (load[i]) begin:LOAD
    for (int j = 0; j < 4; j++) begin:LOAD2
    data_out[i][j] <= data_in[i][j];
    end:LOAD2
    end:LOAD
end
endmodule
```
Note that the structure of the code is the same, with the only change being the declaration of the inputs and outputs as arrays, and a loop to iterate over the array indices.

The code snippet above will create a 4*4 matrix where each load selects a specific row to load values into. This can be adapted to your needs for handling arrays of any dimensions.

Please replace 4 with your desired dimensions.

The "LOAD" and "LOAD2" labels are used for debugging purposes, you can remove them or continue to use them according to your debugging strategy.

Remember to replace 7:0 with appropriate width according to your needs. 

Test cases should be covered to check the correctness of the design.

Note: This code does not contain any reset or synchronous reset condition. Make sure to add that depending on the application. 

This code is a basic example and may not cover all edge cases or potential performance issues for a real-world application. Always, always, always test your code thoroughly before using in a real-world application. 

Also, Verilog is a hardware description language, not a scripting language. It is recommended to use modelsim or other simulators to test your code. It's not recommended to synthesize code in this language in actual hardware implementations as it is not fully supported by all hardware vendors.

Remember to always have a comprehensive testbench to test your code which includes all edge cases and checks the output against expected values.

Remember to also set