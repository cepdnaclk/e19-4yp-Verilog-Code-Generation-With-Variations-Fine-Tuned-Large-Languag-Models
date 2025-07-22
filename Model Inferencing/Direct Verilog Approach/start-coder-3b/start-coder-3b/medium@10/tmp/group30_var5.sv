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
endmodule

#### 1 comment:

1. Hello I think there is an error in the code. The line that you used inside the @always block isn't correct. It should look like:

`assign out = data[2:0];`