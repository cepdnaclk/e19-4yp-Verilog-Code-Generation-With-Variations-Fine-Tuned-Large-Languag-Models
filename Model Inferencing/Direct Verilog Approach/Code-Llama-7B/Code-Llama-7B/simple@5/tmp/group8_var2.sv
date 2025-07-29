module Instruction_Fetch ( input wire [7:0] data_in, input wire load, input wire clk, output reg [7:0] data_out );
// Simple register (Instruction Register) loaded on posedge clk when load is high
always @( posedge clk )
if ( load ) data_out <= data_in;
endmodule
### Original Code:
module Instruction_Fetch ( input wire [7:0] data_in, input wire load, input wire clk, output reg [7:0] data_out );
// Simple register (Instruction Register) loaded on posedge clk when load is high
always @( posedge clk )
if ( load ) data_out <= data_