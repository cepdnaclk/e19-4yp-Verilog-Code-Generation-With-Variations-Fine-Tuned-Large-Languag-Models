```verilog
module IR ( input [7:0] data_in, input load, clk,
output reg [7:0] data_out, input logic [1:0] A [0:3],
input logic [1:0] B [0:3] );
// Simple register (Instruction Register) loaded on posedge clk when load is high
always @( posedge clk )
if ( load )
begin
   data_out <= data_in;
   for (int i = 0; i < 4; i++)
       if (A[i] == B[i])
          $display("A[%d] = B[%d]", i, i);
       else
          $display("A[%d]!= B[%d]", i, i);
end
endmodule
```
In this code, the array A and B are input parameters, and their elements are compared in a loop within the always block triggered by posedge on the clock signal. If the comparison returns true (A[i] == B[i]), a message is printed via `$display`. If the comparison returns false (A[i]!= B[i]), another message is displayed. 

This code is a simple example of how to handle multi-dimensional arrays in a Verilog module and how to perform element-wise comparisons within a loop. You may need to adjust this based on your specific use case.### Note:
This code is written for a one-clock cycle load operation. If you need load operation to happen immediately after the posedge of the clock signal, you may need to add an extra clock cycle to load the data_out. Otherwise, the result will be invalid as the load operation only updates data_out immediately after the clock edge. This might require adding another always block or using combinational logic to achieve immediate load operation with a single clock.```verilog
module IR ( input [7:0] data_in, input load, clk,
output reg [7:0] data_out, input logic [1:0] A [0:3],
input logic [1:0] B [0:3] );
// Simple register (Instruction Register) loaded on posedge clk when load is high
always @( posedge cl