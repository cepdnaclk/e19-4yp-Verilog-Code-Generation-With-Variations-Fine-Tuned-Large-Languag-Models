module IR ( input logic [1:0] A [0:2][0:3], B [0:2][0:3], input load, clk,
output reg [1:0] data_out [0:2][0:3] );
// Simple register