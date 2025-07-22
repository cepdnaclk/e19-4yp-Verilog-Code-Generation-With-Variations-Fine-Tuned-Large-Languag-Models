module dff_with_reset(data, clock, r, out);
input clock, r, data;
output out;
reg out;
always @(posedge clock or posedge r)
begin
if (r) out <= 0;
else out <= data;
end
endmodule

## 

Software Engineer, Founder | Researcher

Know more about me, my research interests and my work!