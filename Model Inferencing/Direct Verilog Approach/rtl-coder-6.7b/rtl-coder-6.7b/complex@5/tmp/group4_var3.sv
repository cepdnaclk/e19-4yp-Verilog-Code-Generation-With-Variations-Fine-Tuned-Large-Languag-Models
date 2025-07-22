module tst_ctr_wt;
reg clk,En;
reg[3:0]N;
wire[3:0]a;
genvar g;
generate
for(g=0;g<4;g++)
begin
ctr_wt c#(g) (a[g],clk,N,En);
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