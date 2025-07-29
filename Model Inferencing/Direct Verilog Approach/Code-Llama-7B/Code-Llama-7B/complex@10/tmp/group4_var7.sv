module tst_ctr_wt;
reg clk,En;
reg[3:0]N;
wire[3:0]a;
ctr_wt c1(a,clk,N,En);
initial
begin
clk=0; N=4'b1111; // Set limit to 15
En=1'b0; // Start disabled
end
always
initial #35 $stop; // Stop simulation
initial $monitor($time,"clk=%b, En=%b, N=%d, a=%d",clk,En,N,a); // Corrected format specifiers
endmodule
module ctr_wt(a,clk,N,En);
input clk,En;
input[3:0]N;
output reg[3:0]a;
parameter M=16;
reg[3:0]cnt;
always @(posedge clk)
if(En)
cnt <= cnt+1'b1;
generate
genvar i;
for(i=0;i<M;i=i+1)
if(i<=N)
begin : ncnt
  always @(cnt)
  if(cnt==i)
  begin
    a=i;
  end
end
endgenerate
endmodule