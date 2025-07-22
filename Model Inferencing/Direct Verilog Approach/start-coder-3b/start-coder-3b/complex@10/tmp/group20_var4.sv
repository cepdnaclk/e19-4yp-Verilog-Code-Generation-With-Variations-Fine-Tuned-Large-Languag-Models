```
module mixed_sim_mod;
localparam mealy = 1'b1;
reg dcontrol, x, y;
reg [31:0] data;
wire [31:0] bus;
package pkg_slice_param_local;
localparam state_Mealy[] = mealy;
assign bus = inside(dcontrol, state_Mealy)? data : 'bz;
always @x
y