module updcounter(output reg[3:0]a,input clk,input reg[3:0]N,input rst,input up_down);
reg[3:0]b;
always @(posedge clk or negedge rst)
begin
if (!rst)
a=4'b0;
else
if(up_down)
begin
if (a==N)
a=4'b0;
else
a=a+1;
end
else
begin
if (a==4'b0)
a=N;
else
a=a-1;
end
end
endmodule