module DataComponent (DataIn, DataOut, ControlSignals);
input [7:0] DataIn;
output [7:0] DataOut;
input ControlSignals;
reg [7:0] DataIn;
reg [7:0] DataOut;

struct rand_struct {
rand rand;
};
rand_struct rand_array [16];

always_comb #0 DataOut = DataIn;

if (ControlSignals) begin
rand_array [rand_gen_random_number] = rand_structrandom_number;
endendmodule

#### Verilog Unit Test:

module DataComponentTest;

wire [7:0] DataIn;
wire [7:0] DataOut;
wire ControlSignals;

DataComponent DUT (DataIn, DataOut, ControlSignals);

initial begin
$dumpfile("out.v