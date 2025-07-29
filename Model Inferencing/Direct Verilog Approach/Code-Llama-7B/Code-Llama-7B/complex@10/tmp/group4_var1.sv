module tst_ctr_wt;
reg clk,En;
reg[3:0]N;
wire[3:0]a;
generate
genvar i;
for(i=0; i<4; i++)begin:ctrs
ctr_wt c1(.a(a[i]),.clk(clk),.N(N),.En(En));
end
endgenerate
initial
begin
clk=0; N=4'b1111; // Set limit to 15
En=1'b0; // Start disabled
end
always
initial #35 $stop; // Stop simulation
initial $monitor($time,"clk=%b, En=%b, N=%d, a=%d",clk,En,N,a); // Corrected format specifiers
endmodule
### Output:

### Explanation:
### Sources:
* https://www.edaplayground.com/x/4Ly