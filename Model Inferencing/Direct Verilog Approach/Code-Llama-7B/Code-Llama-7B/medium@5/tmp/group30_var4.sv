module dff_with_reset(data, clock, r, out);
input clock, r, data;
output out;
reg out;
always @(posedge clock or posedge r)
begin
if (r)
out = 0;
else if(data inside { out[9:8] })
out = data;
end
endmodule
### Expected Output:
Pass
### Simulation Time:
300ms