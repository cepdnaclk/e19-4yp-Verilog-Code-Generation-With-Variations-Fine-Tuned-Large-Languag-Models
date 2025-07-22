module dec2_4beh (o,i);
output [3:0]o;
input [1:0] i;
if(i[1]==0)
begin
if(i[0]==0) o = {3'b000,1'b1};
else o = {3'b001,1'b0};
end
else
if(i