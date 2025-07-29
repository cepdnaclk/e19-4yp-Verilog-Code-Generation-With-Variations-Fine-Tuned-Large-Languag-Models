module tst_updcounter();//TEST_BENCH
reg clk,u_d;
reg[3:0]N;
wire[3:0]a;
updcounter c2(a,clk,N,u_d);
parameter RST_X = 1'b1;
generate
initial
begin
#34
N = 4'b0111;
u_d = 1'b1;
clk = 0;
end
always #2 clk=~clk;
always #34 u_d=~u_d;
endgenerate
initial $monitor