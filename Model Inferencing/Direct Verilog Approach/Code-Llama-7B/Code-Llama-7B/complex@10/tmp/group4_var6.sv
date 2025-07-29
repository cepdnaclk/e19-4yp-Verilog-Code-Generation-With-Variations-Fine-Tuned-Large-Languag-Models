module tst_ctr_wt #(parameter N=4) (a,clk,N,En);
parameter N;
reg[N-1:0]a;
input clk,En;
reg a[0:N-1];
genvar i;
generate
for (i=0; i<N; ++i) begin: Counter
if (i==0) begin: First
always @(posedge clk)
if (En) a[i]<=1'b1; else a[i]<=a[N-1];
end else begin: Last
always @(posedge clk)
if (En) a[i]<=a[i-1]; else a[i]<=a[N-1];
end
end // for loop
endgenerate
endmodule