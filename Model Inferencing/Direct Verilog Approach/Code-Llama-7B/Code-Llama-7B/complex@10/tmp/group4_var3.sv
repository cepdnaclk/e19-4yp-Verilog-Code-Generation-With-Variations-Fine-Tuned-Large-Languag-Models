module tst_ctr_wt;
reg clk,En;
reg[3:0]N;
wire[3:0][3:0]a;
genvar i;
generate
for (genvar i=0; i<1; i++) begin
    ctr_wt #("c_%0d",i) c1(a[i],clk,N,En);
    // ctr_wt #("c_%u",i) c1(a[i],clk,N,En);
    // ctr_wt #("c_%b",i) c1(a[i],clk,N,En);
    // ctr_wt #("c_%o",i) c1(a[i],clk,N,En);
    // ctr_wt #("c_%d",i) c1(a[i],clk,N,En);
    // ctr_wt #("c_%h",i) c1(a[i],clk,N,En);
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