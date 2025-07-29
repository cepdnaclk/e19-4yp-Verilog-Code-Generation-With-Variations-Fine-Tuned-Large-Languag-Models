module gates4_top (
input wire [3:0] sw,
output wire [2:0] ld
);
reg [2:0] p1;
// Add case for priority
p1 = 0;
// This is the switch statement
case(sw):
3'b001: p1 = 3; // Set 'priority' to 3 if sw = 3'b001
3'b110: p1 = 2; // Set 'priority' to 2 if sw = 3'b110
3'b101: p1 = 1; // Set