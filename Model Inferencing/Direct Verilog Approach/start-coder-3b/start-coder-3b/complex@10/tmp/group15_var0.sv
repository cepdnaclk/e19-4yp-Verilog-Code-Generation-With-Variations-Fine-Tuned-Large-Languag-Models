module tst_updcounter();//TEST_BENCH
reg clk,u_d;
reg[3:0]N;
wire[3:0]a;
initial begin
N = 4'b0111; // Set limit N=7
u_d = 1'b1; // Start counting up (Corrected: was 1'b0)
clk = 0;
end
always #