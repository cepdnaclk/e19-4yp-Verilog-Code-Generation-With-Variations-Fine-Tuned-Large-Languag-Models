module gates4_top (
input wire [3:0] sw,
output wire [2:0] ld
);
// priority case(2)
reg [1:0] priority1[3:0];
priority1[0][0] = 2'b00;
priority1[0][1] = 2'b01;
priority1[1][0] = 2