module example7_10(x1, x2, x3, Clock, x, y, z);
input x1, x2, x3, Clock;
output x, y, z;
reg x, y, z;

wire [2:0] f = {x1, x2, x3};
wire [2:0] g = {x1, f, x3};

always @(posedge Clock)
begin
    case(f)
        2'b00: z = 1'b0;
        2'b01: z =