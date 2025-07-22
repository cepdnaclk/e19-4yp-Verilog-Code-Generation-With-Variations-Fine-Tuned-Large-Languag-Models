module dff_with_reset(data, clock, r, out);
input clock, r, data;
output out;
reg out;
initial begin
if (r)
out = 0;
else
out = data;
end
endmodule