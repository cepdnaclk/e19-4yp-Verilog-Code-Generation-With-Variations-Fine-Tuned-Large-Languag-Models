module tst_updcounter();
reg[3:0]N;
reg clk,u_d;
wire[3:0]a;
updcounter c2(a,clk,N,u_d);
parameter delay =10;
parameter RST_X = 4'd5; // Reset Value
initial
begin
N = 4'd15;
u_d = 1'b0;
#(delay) clk = 0;
end
generate
begin
for (genvar i = 0; i < RST_X; i++)
always #delay clk = ~clk;
always #delay u_d=~u_d;
end
endgenerate
initial $monitor
($time,"clk=%b, N=%d, u_d=%b, a=%d",clk,N,u_d,a);
initial #128 $stop;
endmodule
### Verification Code:
module tst_updcounter();
reg[3:0]N;
reg clk,u_d;
wire[3:0]a;
updcounter c2(a,clk,N,u_d);
parameter delay =10;
parameter RST_X = 4'd7; // Reset Value
initial
begin
N = 4'd15;
u_d = 1'b0;
#(delay) clk = 0;
end
generate
begin
for (genvar i = 0; i < RST_X; i++)
always #delay clk = ~clk;
always #delay u_d=~u_d;
end
endgenerate
initial $monitor
($time,"clk=%b, N=%d, u_d=%b, a=%d",clk,N,u_d,a);
initial #128 $stop;
endmodule