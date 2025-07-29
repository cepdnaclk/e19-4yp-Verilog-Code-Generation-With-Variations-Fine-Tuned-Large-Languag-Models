module latch_param (input [7:0] d, c, output [7:0] q );
genvar i;
parameter w = 8;
generate
genvar j;
if( w== 8 )begin
for ( i = 0; i <= 7; i = i + 1 )
begin: