module IR (input [7:0] data_in, input load, clk,
output [7:0] data_out);
// Simple register (Instruction Register) loaded on posedge clk when load is high
always @(posedge clk)
if (load) data_out <= data_in;
endmodule