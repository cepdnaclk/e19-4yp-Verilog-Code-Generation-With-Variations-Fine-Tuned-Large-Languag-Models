module maj3 (a, b, c, y);
input a, b, c;
output y;
reg [3:0] rega, regb, regc;
always @(*) begin
rega = a; regb = b; regc = c;
if (a | b | c)
    y = 1'b1;
else 
    y = 1'b0;
end
endmodule
### Modified SOPC Models:
none
### Modified Verilog Variations: