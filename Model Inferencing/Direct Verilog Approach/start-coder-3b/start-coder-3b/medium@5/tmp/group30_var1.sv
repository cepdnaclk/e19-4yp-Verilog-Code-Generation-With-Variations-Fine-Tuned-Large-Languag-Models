module d_type_component(data, clock, r, s, out);
input clock, r, s, data;
output out;
reg out;
always @ (posedge clock)
begin
if (r)
out = 0;
else
if (s)
out = (data[3:2] == 2'b01)? 2'b00 : data;
else
out = out;
end
end
endmodule