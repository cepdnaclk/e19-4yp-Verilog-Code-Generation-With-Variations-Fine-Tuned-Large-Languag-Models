module IR ( input [7:0] data_in, input load, clk, output reg [7:0] data_out );
always @( posedge clk )
if ( load ) data_out <= data_in;
endmodule
### Testbench Code:
module IR_tb;
parameter int width = 8;
logic clk;
reg [7:0] data_in, data_out;
reg load = 1'b0;

initial clk = 1'b0;
initial begin
#width 1 clk = 1'b1;
#width 1 clk = 1'b0;
end
IR (data_in, load, clk, data_out);
endmodule