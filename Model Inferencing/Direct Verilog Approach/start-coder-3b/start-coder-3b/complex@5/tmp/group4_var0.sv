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
### Output Before
`
clk=01111 N=15, a=15, En=0
clk=01111 N=15, a=15, En=0
clk=01111 N=15, a=15, En=0
clk=01111 N=15, a=15, En=0
clk=01111 N=15, a=15, En=0
clk=01111 N=15, a=15, En=0
clk=01111 N=15, a=15, En=0
clk=01111 N=15, a=15, En=0
clk=01111 N=15, a=15, En=0
clk=01111 N=15, a=15, En=0
clk=01111 N=15, a=15, En=0
clk=01111 N=15, a=15, En=0
clk=01111 N=15, a=15, En=0
clk=01111 N=15, a=15, En=0
clk=01111 N=15, a=15, En=0
clk=01111 N=15, a=15, En=0
clk=01111 N=15, a=15, En=0
clk=01111 N=15, a=15, En=0
clk=01111 N=15, a=15, En=0
clk=01111 N=15, a=15, En=0
clk=01111 N=15, a=15, En=0
clk=01111 N=15, a=15, En=0
clk=01111 N=15, a=15, En=0
clk=01111 N=15, a=15, En=0
clk=01111 N=15, a=15, En=0
clk=01111 N=15, a=15, En=0
clk=01111 N=15, a=15, En=0
clk=01111 N=15, a=15, En=0
clk=01111 N=15, a=15, En=0
clk=01111 N=15, a=15, En=0
clk=01111 N=15, a=15, En=0
clk=01111 N=15, a=15, En=0
clk=01111 N=15, a=15, En=0
clk=01111 N=15, a=15, En=0
clk=01111 N=15, a=15, En=0
clk=01111 N=15, a=15, En=0
clk=01111 N=15, a=15, En=0
clk=01111 N=15, a=15, En=0
clk=01111 N=15, a=15, En=0
clk=01111 N=15, a=15, En=0
clk=01111 N=15, a=15, En=0
clk=01111 N=15, a=15, En=0
clk=01111 N=15, a=15, En=0
clk=01111 N=15, a=15, En=0
clk=01111 N=15, a=15, En=0
clk=01111 N=15, a=15, En=0
clk=01111 N=15, a=15, En=0
clk=01111 N=15, a=15, En=0
clk=01111 N=15, a=15, En=0
clk=01111 N=15, a=15, En=0
clk=01111 N=15, a=15, En=0
clk=01111 N=15, a=15, En=0
clk=01111 N=15, a=15, En=0
clk=01111 N=15, a=15, En=0
clk=01111 N=15, a=15, En=0
clk=01111 N=15, a=15, En=0
clk=01111 N=15, a=15, En=0
clk=01111 N=15, a=15, En=0
clk=01111 N=15, a=15, En=0
clk=01111 N=15, a=15, En=0
clk=01111 N=15, a=15, En=0
clk=01111 N=15, a=15, En=0
clk=01111 N=15, a=15, En=0
clk=01111 N=15, a=15, En=0
clk=01111 N=15, a=15, En=0
clk=01111 N=15, a=15, En=0
clk=01111 N=15, a=15, En=0
clk=01111 N=15, a=15, En=0
clk=01111 N=15, a=15, En=0
clk=01111 N=15, a=15, En=0
clk=01111 N=15, a=15, En=0
clk=01111 N=15, a=15, En=0
clk=01111 N=15, a=15, En=0
clk=01111 N=15, a=15, En=0
clk=01111 N=15, a=15, En=0
clk=01111 N=15, a=15, En=0
clk=01111 N=15, a=15, En=0
clk=01111 N=15, a=15, En=0
clk=01111 N=15, a=15, En=0
clk=01111 N=15, a=15, En=0
clk=01111 N=15, a=15, En=0
clk=01111 N=15, a=15, En=0
clk=01111 N=15, a=15, En=0
clk=01111 N=15, a=15, En=0
clk=01111 N=15, a=15, En=0
clk=01111 N=15, a=15, En=0
clk=01111 N=15, a=15, En=0
clk=01111 N=15, a=15, En=0
clk=01111 N=15, a=15, En=0
clk=01111 N=15, a=15, En=0
clk=01111 N=15,