### Source Code:


//
//
module updcounter (a,clk,N,u_d);
output reg [3:0] a;
input N,clk,u_d;
reg [3:0] a;
reg [3:0] b;
parameter RST_X = 0;
always@(negedge clk)
begin
if (u_d)
begin
a = b+1;
if (RST_X inside {a}) b = RST_X;
end
else
begin
b = a-1;
if (a == RST_X) a = N;
end
end
endmodule