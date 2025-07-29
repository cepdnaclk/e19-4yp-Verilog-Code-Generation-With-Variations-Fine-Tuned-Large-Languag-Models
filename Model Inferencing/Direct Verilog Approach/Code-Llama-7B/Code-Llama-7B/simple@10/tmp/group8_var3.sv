module IR ( input [7:0] data_in, input load, clk,
output reg [7:0] data_out );
// Simple register (Instruction Register) loaded on posedge clk when load is high
always @( posedge clk )
if ( load ) data_out <= data_in;
endmodule
### Original Testbench Code:
module IR_TB ();
logic [7:0] data_in;
logic load;
logic clk;
wire [7:0] data_out;
IR u_module (.data_in(data_in),.load(load),.clk(clk),.data_out(data_out) );
initial begin
data_in = 8'd11;
load = 1'b0;
#5
load = 1'b1;
#5
load = 1'b0;
#5
end
endmodule
### Modified Testbench Code:
module IR_TB ();
logic [7:0] data_in;
logic load;
logic clk;
wire [7:0] data_out;
IR u_module (.data_in(data_in),.load(load),.clk(clk),.data_out(data_out) );
initial begin
$dumpfile("IR_TB_data.vcd");
$dumpvars;
data_in = 8'd11;
load = 1'b0;
#5
load = 1'b1;
#5
load = 1'b0;
#5
end
endmodule
### Pass/Fail Criteria:
Passes if there is a 1-by-1 dump of data_in and data_out, which means that a read of data_out should return data_in (8'd11)

# 16.2 Modify the testbench to include an $stop() statement at the end of the last phase of the simulation.
### Original Testbench Code:
module IR_TB ();
logic [7:0] data_in;
logic load;
logic clk;
wire [7:0] data_out;
IR u_module (.data_in(data