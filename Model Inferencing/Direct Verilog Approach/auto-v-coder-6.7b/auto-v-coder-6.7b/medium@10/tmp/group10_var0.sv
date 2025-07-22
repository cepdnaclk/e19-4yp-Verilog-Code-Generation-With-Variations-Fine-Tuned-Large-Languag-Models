```verilog
module reg4_var(D, Clock, Resetn, Q);
input [3:0] D;
input Clock, Resetn;
output [3:0] Q[4];
reg [3:0] Q[4];
always @(posedge Clock or negedge Resetn)
    if (Resetn == 0)
        Q <= '{4{'0}}; // Dynamic array for assigning 4 elements of '0'
    else
        Q[D] <= D; // Assign D to corresponding position in D
endmodule
``` 
In this code, a 4-bit register is defined with 4-element dynamic array called "Q". It is initialized with all elements holding '0' value and then depending on the input "D", the corresponding element of the array "Q" is assigned with the value of input "D". 

The code will behave as a 4-bit register with 4 position. The bit at position "D" will be set with "D" and all other positions will be reset to '0'. This can be used to implement a 4-bit addressable register.

This is a procedural continuous assignment, which means it will be executed every time the sensitivity list (the list of variables that will trigger the block of code) is detected to change. It is not recommended to use procedural continuous assignment (always @()) in synthesis, as it may generate uncontrolled delay for synthesis tools. However, it can be used for simulation purposes to change values based on clock or reset inputs.

Also, this variation applies the concept of combinational logic to the register, making it behave as a binary digit register, which can be used for sequential logic. 

Note: In Verilog, indexing of dynamic arrays and procedural continuous assignments are not supported by all synthesis tools, so always test your designs thoroughly to ensure they function as expected before being synthesized.```verilog
module reg4_var(D, Clock, Resetn, Q);
input [3:0] D;
input Clock, Resetn;
output [3:0] Q[4];
reg [3:0] Q[4];
/*always @(posedge Clock or negedge Resetn)
    if