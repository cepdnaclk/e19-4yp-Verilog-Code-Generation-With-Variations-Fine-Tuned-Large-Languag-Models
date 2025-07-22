module IR ( input [7:0] data_in, input load, clk,
output reg [7:0] data_out );
// Simple register (Instruction Register) loaded on posedge clk when load is high
always @( posedge clk )
if ( load ) data_out <= data_in;
endmodule
### Solution:


### Verification Code:



module top;
// Clock period is 20ns = 50MHz clock
parameter clk_period = 20;
reg [7:0] data_in;
reg load, clk;
wire [7:0] data_out;
reg [7:0] data_out_expected;
IR ir(data_in, load, clk, data_out);
// Clock generator
initial begin
  clk <= 0;
  forever #(clk_period/2) clk <= ~clk;
end
// Apply inputs one at a time
initial begin
  data_in = 0;
  load = 0;
  #(clk_period*2);
  load = 1;
  #(clk_period*2);
  data_in = 8'b01010101;
  #(clk_period*2);
  load = 0;
  #(clk_period*2);
  load = 1;
  #(clk_period*2);
  data_in = 8'b11001100;
  #(clk_period*2);
  load = 0;
  #(clk_period*2);
  load = 1;
  #(clk_period*2);
  data_in = 8'b10101010;
  #(clk_period*2);
  load = 0;
  #(clk_period*2);
  load = 1;
  #(clk_period*2);
  data_in = 8'b01010101;
  #(clk_period*2);
  load = 0;
  #(clk_period*2);
  load = 1;
  #