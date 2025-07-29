module ArrayTest ( input load, clk,
output reg [7:0] data_out );
logic [1:0] A [0:3];
logic B [1:3][2:5];
always @( posedge clk )
if ( load ) data_out <= A;
endmodule
### Expected Output: