module IR ( input [7:0] data_in, input load, clk,
output reg [7:0] data_out );
logic[1:0] A [0:3] = '{2'b01,2'b11,2'b00,2'b10};
logic[1:0] B [0:3] = '{2'b10,2'b01,2'b10,2'b11};
always @( posedge clk )
if ( load ) data_out <= data_in & A & B;
endmodule