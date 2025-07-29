module netdelay2(x,y);
input [7:0] x;
output [7:0] y;
reg [7:0] z;
wire #(2,1) nn; // Declare wire 'nn' with rise=2, fall=1 delay
wire [1:0] n;
reg [1:0] m;
always @(x)
begin
	n <= x;
	m <= n;
	nn <= m;
end
assign y = {24'b0,nn};  // Assign 'nn' to 'y' (direct assignment)
assign z = x; // Assign 'x' to '