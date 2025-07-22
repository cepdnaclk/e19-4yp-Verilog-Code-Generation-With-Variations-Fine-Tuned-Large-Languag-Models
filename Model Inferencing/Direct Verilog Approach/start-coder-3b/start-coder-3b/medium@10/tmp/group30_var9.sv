module dff_with_reset(data, clock, r, out);
input clock, r, data;
output out;
reg out;
always @(posedge clock or posedge r)
begin
out = r? 0 : data;
end
endmodule

## 2002-01-10

### Base Verilog Code:
module dff_with_reset(data