module ctr_wt(reg[3:0]a,input clk,input[3:0]N,input En);
reg[3:0]count;
wire[3:0]ct;
assign a=En?(count==N?0:count+1):count;
wire[3:0]ct;
genvar j;
genvar k;
generate
for (genvar j=0; j<4; j++)
begin: name_block_j
for (genvar k=0; k<4; k++)
begin: name_block_k
if (j==k)
assign ct[j]=N[j];
else
assign ct[j]=N[k];
end: name_block_k
end: name_block_j
endgenerate
always @(posedge clk)
begin
count<=En?ct:count;
end
endmodule