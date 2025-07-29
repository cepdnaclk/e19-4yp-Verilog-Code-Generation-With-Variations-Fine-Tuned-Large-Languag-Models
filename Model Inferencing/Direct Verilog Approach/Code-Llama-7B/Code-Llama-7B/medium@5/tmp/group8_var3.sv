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
### Modified Verilog Code:
module dec2_4beh (o,i);
input [1:0] i;
output [3:0] o;
wire [1:0]i_1;
wire [3:0]o_1;
assign i_1[1:0] = i;
assign o = (i == 2'b10)? 4'b1101 : 
o_1 = (i == 2'b11)? 4'b0110 : 
o_1 = (i == 2'b00)? 4'b010