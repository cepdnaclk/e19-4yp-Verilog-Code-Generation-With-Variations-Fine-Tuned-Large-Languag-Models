module tst_ctr_wt;
reg clk,En;
reg[3:0]N;
wire[3:0]a;
localparam LIMIT=33; // Max limit is 32
generate
   genvar i;
   for(i=0;i<LIMIT;i++)
   begin:Ctr_Wt_Gen
      ctr_wt c1(a[i],clk,N,En);
   end
endgenerate
initial
begin
clk=0; N=4'b1111; // Set limit to 15
En=1'b0; // Start disabled
end
always
initial #35 $stop; // Stop simulation
initial $monitor($time,"clk=%b, En=%b, N=%d, a[0]=%d, a[1]=%d, a[2]=%d, a[3]=%d",
clk,En,N,a[0],a[1],a[2],a[3]); // Corrected format specifiers
endmodule