module dff_with_reset(data, clock, r, out);
input clock, r, data;
output out;
reg out;
always @*
begin
out = data;
if (r)
out =