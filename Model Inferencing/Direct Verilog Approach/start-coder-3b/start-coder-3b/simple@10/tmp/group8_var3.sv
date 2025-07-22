module IR ( input [7:0] data_in, input load,
input [1:0] A [0:3], input [1:0] B [0:3],
output reg [7:0] data_out );
// Simple register (Instruction Register) loaded on posedge clk when load is high
always @( posedge clk )
if ( load ) data_out <= data_in;
endmodule
### Variation Instruction:
Modify the inputs A and B to be elements of a packed 1D logic-vector array (e.g., logic [1:0] A [0:3]) and use