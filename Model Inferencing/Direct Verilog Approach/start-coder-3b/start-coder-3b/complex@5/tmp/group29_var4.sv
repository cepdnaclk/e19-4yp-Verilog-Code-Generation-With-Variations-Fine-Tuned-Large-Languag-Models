module rom_to_ram (data_in, data_out, ram_in, ram_out, En, clock, rst);
output reg [15: 0] data_out;
input [15: 0] ram_in, data_in;
input En, clock, rst;
reg [15: 0] data_out_reg;
always @ (posedge clock) begin
if (rst) data_out_reg <= 0;
else begin
if (En) data_out_reg <= data_in;
end
end
always @ (posedge clock) data_out <= data_out_reg;
endmodule
### Testbench:
module top;
reg [7: 0] data;
reg clock, rst;
reg [31: 0] data_in;
reg data_out;
reg [15: 0] ram_in, ram_out;
reg [1: 0] a, b;
reg [15: 0] count;
parameter count_limit = 50;
parameter data_length = 7;

initial begin
clock = 0;
rst = 1;
data = 0;
$display("Testbench for rom-to-ram converter");$display("Inputs: ");
end

initial begin
data = 0;
clock = 1;
rst = 0;
clock = 0;
rst = 1;
end

initial begin
data_out = 0;
$display("State, Ld, En, data, data_out"); end forever begin #5 a = data[3: 0]; b = data[4: 0]; #10 clock = ~clock; #10 rst = 0; #10 data_out = data_out; data_out = ram_out; ram_in = {ram_in[15: 8], ram_in[7: 0]}; ram_out = ram_in[15: 0]; ram_in[15: 0] = ram_out; data_out[0] = {a[0], a[1], a[2], b[2], b[3], a[3], a[4], a[5]}; data_out[1] = {a[0], a[1], a[2], b[2], b[3], a[3], a[4], a[5]}; data_out[2] = {b[0], b[1], a[