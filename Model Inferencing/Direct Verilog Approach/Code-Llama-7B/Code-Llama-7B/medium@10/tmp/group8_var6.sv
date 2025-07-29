module tst_dec2_4beh();
wire [3:0]o;
reg[1:0] i;
//reg en; // Enable not used in dec2_4beh
dec2_4beh dec(o,i);
initial
begin
i =2'b01;
end
initial $monitor ($time, " output o = %b, input i = %b ", o,i);
//  initial #14 $stop; // Stop simulation
//endmodule
//if (en==1'b1)
if (i==2'b01)
begin
o[2] = 4'b1110;
o[3] = 4'b0010;
end
else
begin
o[2] = 4'