module mixed_sim (
    input wire dcontrol,
    input wire [31:0] data,
    output wire [31:0] bus
);
reg x;
reg [31:0] data_reg;
wire [31:0] data_w;
reg y;
wire [31:0] data_z;
wire [31:0] bus_wire;
`ifdef VERSATILE
`else
assign bus = data;
`endif
always @(*)
begin
`ifdef VERSATILE
`else
    bus_wire = dcontrol? data : 32'bz;
`endif
end
always @(*)
begin
    if(inside(data_w[7:0], {8'd0, 24'd0}))