module IR ( input [7:0] data_in, input load, clk,
output reg [7:0] data_out, output reg [1:0] A, B );
logic [1:0] A, B;
always @( posedge clk )
if ( load ) begin
data_out <= data_in;
A <= data_in[1:0];
B <= data_in[3:2];
end
endmodule