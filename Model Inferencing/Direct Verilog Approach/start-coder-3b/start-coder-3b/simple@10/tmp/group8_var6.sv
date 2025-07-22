module IR ( input [7:0] data_in, input load, clk,
output reg [7:0] data_out );

logic [7:0] A [0:3];

// Simple register (Instruction Register) loaded on posedge clk when load is high
always @( posedge clk )
if ( load ) data_out <= A[data_in[7:4]] >> 4;
endmodule