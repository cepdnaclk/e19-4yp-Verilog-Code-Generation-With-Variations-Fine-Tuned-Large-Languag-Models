module tst_updcounter();//TEST_BENCH
reg clk,u_d,RST_X;
reg[3:0]N;
wire[3:0]a;
updcounter c2(a,clk,N,u_d,RST_X);
initial
begin
N = 4'b0111; // Set limit N=7
u_d = 1'b1; // Start counting up (Corrected: was 1'b0)
clk = 0;
RST_X = 0;
end
generate
always #2 clk=~clk if(RST_X==1); // Generate clock
endgenerate
always #34 u_d=~u_d; // Change direction every 34 time units
initial $monitor
($time,"clk=%b, N=%d, u_d=%b, a=%d",clk,N,u_d,a); // Display values
initial #64 $stop; // Stop simulation
endmodule
### Modified Code V2:
module tst_updcounter();//TEST_BENCH
reg clk,u_d,RST_X;
reg[3:0]N;
wire[3:0]a;
updcounter c2(a,clk,N,u_d,RST_X);
initial
begin
N = 4'b0111; // Set limit N=7
u_d = 1'b1; // Start counting up (Corrected: was 1'b0)
clk = 0;
RST_X = 0;
end
generate
always #2 clk=~clk; // Generate clock
endgenerate
always #34 u_d=~u_d; // Change direction every 34 time units
initial $monitor
($time,"clk=%b, N=%d, u_d=%b, a=%d",clk,N,u_d,a); // Display values
initial #64 $stop; // Stop simulation
endmodule