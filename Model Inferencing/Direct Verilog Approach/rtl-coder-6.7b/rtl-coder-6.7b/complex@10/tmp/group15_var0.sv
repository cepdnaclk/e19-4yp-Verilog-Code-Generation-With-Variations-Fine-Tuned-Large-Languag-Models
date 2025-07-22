module tst_updcounter();//TEST_BENCH
parameter CLOCK_RATE_MHZ=100;
parameter CLOCK_PERIOD_NS=1000/CLOCK_RATE_MHZ;
reg clk,u_d,RST_X;
reg[3:0]N;
wire[3:0]a;
updcounter c2(a,clk,N,u_d);
initial
begin
N = 4'b0111; // Set limit N=7
u_d = 1'b1; // Start counting up (Corrected: was 1'b0)
clk = 0;
RST_X = 1'b0;
end
generate
begin:clk_gen
if (CLOCK_RATE_MHZ == 0)
begin
always #456 clk=~clk; // Generate clock
end
else
begin
always #CLOCK_PERIOD_NS clk=~clk; // Generate clock
end
end
endgenerate
always #64 $stop; // Stop simulation 
initial $monitor
($time,"clk=%b, N=%d, u_d=%b, a=%d",clk,N,u_d,a); // Display values
endmodule