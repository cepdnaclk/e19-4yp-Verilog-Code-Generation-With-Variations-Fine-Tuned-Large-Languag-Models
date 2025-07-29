module dff3_variation(data, clock, out, nreset);
input clock, data, nreset;
output [2:0] out;
reg out;
always @(posedge clock, negedge nreset)
begin
if (!nreset)
out = 0;
else
out[0] = data[0];
out[1] = data[1];
out[2] = data[2];
end
endmodule
### Modified Verilog Output:
module dff3_variation(data, clock, out, nreset);
input clock, data, nreset;
output [2:0] out;
reg out;
always @(posedge clock, negedge nreset)
begin
if (!nreset)
out = 0;
else
out[0] = data[0];
out[1] = data[1];
out[2] = data[2];
end
endmodule
### Simulation:
##### Original:
![original](https://github.com/wesleysubiotto/CircuitVerilog/blob/master/images/dff3_original.png)
##### Partial:
![partial](https://github.com/wesleysubiotto/CircuitVerilog/blob/master/images/dff3_partial.png)
##### Variation:
![variation](https://github.com/wesleysubiotto/CircuitVerilog/blob/master/images/dff3_variation.png)
### Base Verilog Code:
module shift_left(a, b, c, d, e, f, out);
input [7:0] a, b, c, d, e, f;
output [7:0] out;
wire [7:0] a, b, c, d, e, f;
assign a = 8'b11110000;
assign b = 8'b01110000;
assign c = 8'b00110000;
assign d = 8'b00010000;
assign e = 8'b00001111;
assign f = 8'b