module dec2_4beh(o,i);
output o;
input[3:0] i;
//reg [1:0] en;
reg clk;
reg[1:0] en;
always @ *
begin
if(i[0])
en[0] <= 2'b01;
else if(i[1])
o <= 4'b0100;
else if(i[2])
o <= 4'b0010;
else if(i[3])
o <= 4'b0001;
else
o <= 4'b0100;
end
endmodule