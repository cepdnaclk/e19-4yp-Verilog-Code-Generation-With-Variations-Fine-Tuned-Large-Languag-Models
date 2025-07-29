module IR (input logic [7:0] data_in, input load, clk,
output reg [7:0] data_out );
logic [1:0] A [0:3];
logic [1:0] B [0:3];
// Simple register (Instruction Register) loaded on posedge clk when load is high
always @( posedge