module dff_with_reset(data, clock, r, out);
input clock, r, data;
output [31:0] out;
reg [31:0] out;
always @(posedge clock or posedge r)
begin
if (r)
out = 0;
else
begin
if (data in [0:5])
out = data;
else
$error("Error: Invalid data %0d", data);
end
end