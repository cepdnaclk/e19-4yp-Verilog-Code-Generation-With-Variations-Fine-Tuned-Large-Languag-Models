module dff_with_reset(data, clock, r, out);
input clock, r, data;
output out;
reg out;
always @(posedge clock or posedge r)
begin
if (r)
out = 0;
else
out = data;
end
out = 0;
endmodule
### Analysis:
The following errors were detected in the design:
Error(s) in the design:
Error(s) in the design:
The specified module design contains the following errors:
Error(s) in the design:
The specified module design contains the following errors:
Error(s) in the design:
The specified module design contains the following errors:
Error(s) in the design:
The specified module design contains the following errors:
Error(s) in the design:
The specified module design contains the following errors:
Error(s) in the design:
The specified module design contains the following errors:
Error(s) in the design:
The specified module design contains the following errors:
Error(s) in the design:
The specified module design contains the following errors:
Error(s) in the design:
The specified module design contains the following errors:
Error(s) in the design:
The specified module design contains the following errors:
Error(s) in the design:
The specified module design contains the following errors:
Error(s) in the design:
The specified module design contains the following errors:
Error(s) in the design:
The specified module design contains the following errors: