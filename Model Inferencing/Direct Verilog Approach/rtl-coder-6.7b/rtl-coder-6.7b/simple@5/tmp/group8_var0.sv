module IR ( input [7:0] data_in, input logic [3:0] load_addr, input load, clk,
output reg [7:0] data_out );
// Register array loaded on posedge clk when load is high
always @( posedge clk )
if ( load ) data_out <= data_in;
endmodule