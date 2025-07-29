module tst_updcounter();//TEST_BENCH
reg clk,u_d;
reg[3:0]N;
wire[3:0]a;
updcounter c2(a,clk,N,u_d);
always #2 clk=~clk; // Generate clock
initial
begin
N = 4'b0111; // Set limit N=7
u_d = 1'b1; // Start counting up (Corrected: was