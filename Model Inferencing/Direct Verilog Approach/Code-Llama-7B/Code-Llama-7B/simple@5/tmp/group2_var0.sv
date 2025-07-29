module test;
reg packed struct {
    logic x;
    logic y;
    logic z;
} a;
wire x, y, z;
assign #25 a = {1'b1, 1'b0, 1'b1};
always begin
    x = #10 a.x;
    y = #20 a.y;