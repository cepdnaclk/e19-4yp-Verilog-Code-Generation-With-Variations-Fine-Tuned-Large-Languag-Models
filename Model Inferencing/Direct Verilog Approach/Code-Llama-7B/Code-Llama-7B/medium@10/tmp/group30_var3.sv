module dff_with_reset(data, clock, r, out);
input clock, r, data;
output out;
reg out;
always @(posedge clock or posedge r)
begin
if (r)
out = 0;
else if (data inside {5,10,15,25,35,68,80,85, 98, 100})
out = data;
end
endmodule
### Variation Instruction:
Use inside operator inside a procedural block to check array membership in a part-select range.