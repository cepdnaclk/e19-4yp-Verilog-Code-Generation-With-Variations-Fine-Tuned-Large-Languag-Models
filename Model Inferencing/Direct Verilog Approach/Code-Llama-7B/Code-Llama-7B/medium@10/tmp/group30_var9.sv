module dff_with_reset(data, clock, r, out);
input clock, r, data;
output out;
reg out;
always @(posedge clock or posedge r)
begin
if (r)
out = 0;
for (integer i = 0; i < 8; i++)
begin
for (integer j = i; j < 8; j