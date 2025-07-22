module IR ( input [1:0] data_in, input [1:0] A [0:3], input[1:0] B [0:3], input load, clk,
output reg [7:0] data_out [0:3] );
// Simple register