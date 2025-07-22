module dff_with_reset(data, clock, r, out);
input clock, r, data;
output out;
reg out;
always @(posedge clock or posedge r)
begin
out = 0;
if (r)
out = 0;
else if (data < 5)
out = 0;
else if (data < 10)
out = 1;
else
out = data;
end