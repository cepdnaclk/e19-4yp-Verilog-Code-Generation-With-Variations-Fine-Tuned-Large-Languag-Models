module updcounter(a,clk,N,u_d,RST_X);
`include "defs.vh"
input[3:0]N;
input clk,u_d,RST_X;
output reg[3:0]a;
initial a=0;
always @(posedge clk)
if(RST_X == 1'b0) // Check for Reset
a=0;
else begin
if(u_d)
begin
if(a==N) // Count up to N
a='b0; // Wrap around to zero
else
a=a+1;
end
else
begin
if(a==0) // Count down to zero
a=N; // Wrap around to N
else
a=a-1;
end
end
endmodule