package package_sim;
reg [31:0] array [0:31];
initial
begin
array = {1, 2, 3, 4, 5, 6, 7, 8};
end
endpackage
### Base Verilog Code:
module mixed_sim;
reg dcontrol, x, y;
reg [31:0] data;
wire [31:0] bus;
assign bus = dcontrol? data : 'bz;
always @x
y = ~x;
initial
begin
$monitor("time=%d dcontrol=%d data=%d x=%d y=%d bus=%d",