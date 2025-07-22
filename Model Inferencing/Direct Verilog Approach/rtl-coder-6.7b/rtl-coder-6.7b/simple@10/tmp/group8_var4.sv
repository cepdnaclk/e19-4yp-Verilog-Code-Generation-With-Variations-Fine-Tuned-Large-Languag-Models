module IR ( input [1:0] data_in [0:3], input load, clk,
output reg [1:0] data_out [0:3] );
// Simple register (Instruction Register) loaded on posedge clk when load is high
always @( posedge clk )
if ( load ) data_out <= data_in;
endmodule
### Testbench:
module tb();
// Inputs
reg data_in[0:3];
reg load;
reg clk;

// Outputs
wire [1:0] data_out;

// Instantiate the Unit Under Test (UUT)
IR uut (
.data_in(data_in), 
.load(load), 
.clk(clk), 
.data_out(data_out)
);

// Clock process definitions
initial begin
clk = 0;
#10;
end

always #10 clk = ~clk;

// Stimulus process
initial begin
load = 0;
data_in = 1;
#20
load = 1;
data_in = 2;
#20
load = 0;
data_in = 4;
#20;
load = 1;
data_in = 6;
#20
load = 0;
data_in = 8;
#20
load = 1;
data_in = 10;
#20
load = 1;
data_in = 12;
#20
load = 1;
data_in = 14;
#20
load = 1;
data_in = 16;
$finish;
end
endmodule
### Verification Results:
Pass