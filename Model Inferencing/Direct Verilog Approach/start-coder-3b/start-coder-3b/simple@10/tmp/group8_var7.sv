module IR ( input [7:0] data_in, input load, clk,
output reg [7:0] data_out );
// Simple register (Instruction Register) loaded on posedge clk when load is high
always @( posedge clk )
if ( load ) data_out <= data_in;
endmodule

## Sample Test Cases

Each of the variations of each instruction type has a corresponding test case that is provided in the verilog file (e.g., ADD_test.v). Note that all variations are implemented for all instruction types.