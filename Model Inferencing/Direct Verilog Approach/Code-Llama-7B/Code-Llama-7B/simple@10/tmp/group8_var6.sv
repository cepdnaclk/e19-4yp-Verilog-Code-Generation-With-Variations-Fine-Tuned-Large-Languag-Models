module IR ( input logic [7:0] A [0:3], input load, clk,
output reg [2:1] data_out );
// Simple register (Instruction Register) loaded on posedge clk when load is high
always @( posedge clk )
if ( load ) begin
logic [7:0] C [0:3];
C = A;
data_out <= C[1] + 1;
end
endmodule