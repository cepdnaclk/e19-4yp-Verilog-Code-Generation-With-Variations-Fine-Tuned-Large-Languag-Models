module dff_with_reset(data, clock, r, out);
input clock, r, data;
output out;
reg out;
(* inside *)
always @(posedge clock or posedge r)
begin
if (r)
out = 0;
else
out = data;
end
endmodule
### Expected code:
module dff_with_reset(data, clock, r, out);
input clock, r, data;
output out;
reg out;
(* inside *)
always @(posedge clock or posedge r)
begin
if (r)
out = 0;
else
out = data;
end
endmodule