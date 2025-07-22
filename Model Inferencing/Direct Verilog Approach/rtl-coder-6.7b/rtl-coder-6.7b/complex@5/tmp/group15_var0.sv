```
// File: updcounter.v
module updcounter(a,clk,rst,N,u_d); // Up/Down Counter
parameter RST_X = 'bxxxx;
input clk,rst,u_d;
input[3:0]N;
output reg[3:0]a;
always @(posedge clk)
if(rst) a = RST_X;
else if(a==0 & u_d==1) a = N;
else if(a==N & u_d==0) a = 0;
else a = a + u_d;
endmodule
```