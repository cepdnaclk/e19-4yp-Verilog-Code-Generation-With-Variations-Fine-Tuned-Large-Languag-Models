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
if (out!= out_prev)
out_prev <= out;
end
endmodule
### Output:

## Final Code:

module dff_with_reset(data, clock, r, out);
input clock, r, data;
output out;
reg out, out_prev;
initial
out_prev = 0;
always @(posedge clock or posedge r)
begin
if (r)
out = 0;
else
out = data;
out <= out;
if (out!= out_prev)
out_prev <= out;
end
endmodule

## Conclusion:

In this article, we have seen an example of using the inside operator inside a procedural block to check array membership in a part-select range.