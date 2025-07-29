module IR_1D_array ( input [7:0] data_in, input load, clk, input [7:0] A [0:3], input [7:0] B [0:3],
output reg [7:0] data_out, parameter [7:0] param [0:3] );
// Simple register (Instruction Register) loaded on posedge clk when load is high
always @( posedge clk )
if ( load ) data_out <= B[data_in];
endmodule
### Output:
ir_1D_array.vj:
module IR_1D_array ( input [7:0] data_in, input load