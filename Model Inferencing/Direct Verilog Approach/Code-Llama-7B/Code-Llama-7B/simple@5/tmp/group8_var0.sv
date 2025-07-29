module Test_IR ( input [7:0] data_in, input load, clk,
output reg [7:0] data_out );
// Simple register (Instruction Register) loaded on posedge clk when load is high
always @( posedge clk )
if ( load ) data_out <= data_in;
reg [1:0] mem_arr [0:3];
initial begin
mem_arr = '{10'b0, 10'b0, 10'b0, 10'b0};
end
endmodule
### Variation Inst