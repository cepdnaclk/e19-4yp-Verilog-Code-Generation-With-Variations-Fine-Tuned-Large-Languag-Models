module tst_ctr_wt_mod_1(input clk,En, input[3:0] N,output[3:0] a);
genvar i, j;
generate
for (i=0; i<=3; i=i+1) begin: l1
for (j=0; j<=i; j=j+1) begin: l2
if (i==0) begin: l3
assign a[j]=clk & En;
end: l3
else begin: l3
assign a[j]=a[j-1] | a[j];
end: l3
end: l2
end: l1
endgenerate
counter_w_en CW(a[i], clk, N[i], En);
endmodule