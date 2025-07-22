module dec2_4beh(o, i);
input [1:0] i;
output reg [3:0] o;
always @ (i)
if (i == 2'b10 |  i == 2'b01 )
o = 4'b0001;
else if (i == 2'b11)
o = 4'b0010;
else o = 4'b0000;
endmodule
### Testbench Verilog Code:
module tst_dec2_4beh();
wire [3:0]o;
reg[1:0] i;
//reg en; // Enable not used in dec2_4beh
dec2_4beh dec(o,i);
initial
begin
i =2'b00;
end
initial $monitor ($time, " output o = %b, input i = %b ", o,i);
initial #14 $stop; // Stop simulation
endmodule