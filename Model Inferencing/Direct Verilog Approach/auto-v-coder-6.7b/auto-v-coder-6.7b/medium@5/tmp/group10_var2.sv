```verilog
module reg4(D, Clock, Resetn, Q, index);
input [3:0] D;
input Clock, Resetn;
output [3:0] Q;
input [1:0] index;
reg [3:0] Q;
always @(posedge Clock or negedge Resetn)
    if (Resetn == 0)
        Q <= 4'b0000;
    else
        Q <= D;
endmodule
```
Now, you can select different indices at runtime. For instance, you could use the `index` variable to select which part of the array (Q[index]) you would like to write your D data to. In this way, you can have control over which register to write/read data to/from. This variation introduces variable `index` to select the specific register.### Please note, this is a simple code variation and it assumes you are aware of the constraints and limitations of actual hardware-based implementations. For a production environment, you would likely need to adjust the code accordingly to satisfy the specifics of your system's requirements. For instance, proper handling of the asynchronous reset signal (Resetn), input and output data types, etc. Make sure to thoroughly test and validate the modified code for any potential issues or unintended effects.```verilog
module reg4(D, Clock, Resetn, Q, index);
input [3:0] D;
input Clock, Resetn;
output [3:0] Q;
input [1:0] index;
reg [3:0] Q[4];
always @(posedge Clock or negedge Resetn)
    if (Resetn == 0)
        for (int i = 0; i < 4; i++)
            Q[i] <= 4'b0000;
    else
        Q[index] <= D;
endmodule
```
In the above modified code, we have made the array size 4-bit and indexed each bit by a 2-bit index value. This will select the desired register to perform the operations. You can use the `index` value to select which register you want to write or read data from/to. This modified design will be more reusable and could potentially