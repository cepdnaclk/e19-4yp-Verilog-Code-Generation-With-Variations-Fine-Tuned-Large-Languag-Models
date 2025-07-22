module IR ( input [7:0] data_in, input load, clk,
output reg [7:0] data_out );
// Simple register (Instruction Register) loaded on posedge clk when load is high
always @( posedge clk )
if ( load )
data_out <= data_in[0:1][0:3][0:7][0:8];
endmodule
### Final Code Output:

## 2.4.2.4.1. Handling Arrays of Arrays¶

Let’s consider a simple 2-D array of