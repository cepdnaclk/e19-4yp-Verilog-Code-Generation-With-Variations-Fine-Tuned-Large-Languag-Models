module tst_ctr_wt_v2;
reg clk,En;
reg[3:0]N;
wire[3:0]a;
genvar i;
generate
for(i=0;i<4;i=i+1)
assign a[i]=N[i];
endgenerate
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
### Results:
```
clk=0, En=0, N=15, a=15
clk=1, En=0, N=15, a=15
clk=0, En=0, N=15, a=15
clk=1, En=0, N=15, a=15
clk=0, En=0, N=15, a=15
clk=1, En=0, N=15, a=15
clk=0, En=0, N=15, a=15
clk=1, En=0, N=15, a=15
clk=0, En=0, N=15, a=15
clk=1, En=0, N=15, a=15
clk=0, En=0, N=15, a=15
clk=1, En=0, N=15, a=15
clk=0, En=0, N=15, a=15
clk=1, En=0, N=15, a=15
clk=0, En=0, N=15, a=15
clk=1, En=0, N=15, a=15
clk=0, En=0, N=15, a=15
clk=1, En=0, N=15, a=15
clk=0, En=0, N=15, a=15
clk=1, En=0, N=15, a=15
clk=0, En=0, N=15, a=15
clk=1, En=0, N=15, a=15
clk=0, En=0, N=15, a=15
clk=1, En=0, N=15, a=15
clk=0, En=0, N=15, a=15
clk=1, En=0, N=15, a=15
clk=0, En=0, N=15, a=15
clk=1, En=0, N=15, a=15
clk=0, En=0, N=15, a=15
clk=1, En=0, N=15, a=15
clk=0, En=0, N=15, a=15
clk=1, En=0, N=15, a=15
clk=0, En=0, N=15, a=15
clk=1, En=0, N=15, a=15
clk=0, En=0, N=15, a=15
clk=1, En=0, N=15, a=15
clk=0, En=0, N=15, a=15
clk=1, En=0, N=15, a=15
clk=0, En=0, N=15, a=15
clk=1, En=0, N=15, a=15
clk=0, En=0, N=15, a=15
clk=1, En=0, N=15, a=15
clk=0, En=0, N=15, a=15
clk=1, En=0, N=15, a=15
clk=0, En=0, N=15, a=15
clk=1, En=0, N=15, a=15
clk=0, En=0, N=15, a=15
clk=1, En=0, N=15, a=15
clk=0, En=0, N=15, a=15
clk=1, En=0, N=15, a=15
clk=0, En=0, N=15, a=15
clk=1, En=0, N=15, a=15
clk=0, En=0, N=15, a=15
clk=1, En=0, N=15, a=15
clk=0, En=0, N=15, a=15
clk=1, En=0, N=15, a=15
clk=0, En=0, N=15, a=15
clk=1, En=0, N=15, a=15
clk=0, En=0, N=15, a=15
clk=1, En=0, N=15, a=15
clk=0, En=0, N=15, a=15
clk=1, En=0, N=15, a=15
clk=0, En=0, N=15, a=15
clk=1, En=0, N=15, a=15
clk=0, En=0, N=15, a=15
clk=1, En=0, N=15, a=15
clk=0, En=0, N=15, a=15
clk=1, En=0, N=15, a=15
clk=0, En=0, N=15, a=15
clk=1, En=0, N=15, a=15
clk=0, En=0, N=15, a=15
clk=1, En=0, N=15, a=15
clk=0, En=0, N=15, a=15
clk=1, En=0, N=15, a=15
clk=0, En=0, N=15, a=15
clk=1, En=0, N=15, a=15
clk=0, En=0, N=15, a=15
clk=1, En=0, N=15, a=15
clk=0, En=0, N=15, a=15
clk=1, En=0, N=15, a=15
clk=0, En=0, N=15, a=15
clk=1, En=0, N=15, a=15
clk=0, En=0, N=15, a=15
clk=1, En=0, N=15, a=15
clk=0, En=0, N=15, a=15
clk=1, En=0, N=15, a=15
clk=0, En=0, N=15, a=15
clk=1, En=0, N=15, a=15
clk=0, En=0, N=15, a=15
clk=1, En=0, N=15, a=15
clk=0, En=0, N=15, a=15
clk=1, En=0, N=15, a=15
clk=0, En=0, N=15, a=15
clk=1, En=0, N=15, a=15
clk=0, En=0, N=15, a=15
clk=1, En=0, N=15, a=15
clk=0, En=0, N=15, a=15
clk=1, En=0, N=15, a=15
clk=0, En=0, N=15, a=15
clk=1, En=0, N=15, a=15
clk=0, En=0, N=15, a=15
clk=1, En=0, N=15, a=15
clk=0, En=0, N=15, a=15
clk=1, En=0,