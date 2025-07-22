module IR ( input [7:0] data_in, input load, clk,
output reg [7:0] data_out );
logic [1:0] A, B;
//Simple register (Instruction Register) loaded on posedge clk when load is high
always @( posedge clk )
//if ( load ) data_out <= data_in;
if ( load ) begin data_out <= data_in; A[0:3] <= data_in; B[0:3] <= data_in; end
endmodule