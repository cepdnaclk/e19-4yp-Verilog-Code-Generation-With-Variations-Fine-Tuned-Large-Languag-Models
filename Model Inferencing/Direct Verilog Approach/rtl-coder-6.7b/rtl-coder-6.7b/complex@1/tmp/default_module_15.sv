module updcounter(a,clk,N,u_d);
input u_d,clk;
input[3:0]N;
output[3:0]a;
reg[3:0]a;
generate
initial
begin
a = 0;
end
always @(posedge clk)
begin
if (u_d ==1'b0)
a = a + 1;
else if (u_d ==1'b1)
a = a - 1;
end
if(a > N)
a = a - N; // Wrap-around if overflow
endgenerate
endmodule