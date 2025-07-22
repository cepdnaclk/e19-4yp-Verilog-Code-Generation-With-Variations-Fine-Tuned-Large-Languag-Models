module tst_updcounter();//TEST_BENCH
reg clk,u_d;
reg [3:0] N;
wire [3:0] a;
//updcounter c2(a,clk,N,u_d);
updcounter c2(a,clk,N,u_d);
initial
begin
N = 4'b0111; // Set limit N=7
u_d = 1'b1; // Start counting up (Corrected: was 1'b0)
clk = 0;
end
// Always block to generate clk signal
always #2 clk=~clk;
//generate block
generate
if(RST_X)
always #34 u_d=~u_d; // Change direction every 34 time units
else #2 clk=~clk; // Generate clock
endgenerate
initial $monitor
($time,"clk=%b, N=%d, u_d=%b, a=%d",clk,N,u_d,a); // Display values
initial #64 $stop; // Stop simulation
endmodule