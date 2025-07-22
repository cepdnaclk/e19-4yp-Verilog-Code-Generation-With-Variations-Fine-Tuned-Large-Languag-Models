module nil;
reg [7:0] a;
reg b;
always @(*)
begin
if (a[7:2] == 5'b00101)
begin
// do something
end