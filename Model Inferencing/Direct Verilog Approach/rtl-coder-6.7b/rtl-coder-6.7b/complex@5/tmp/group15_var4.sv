module tst_updcounter ();
reg clk,u_d,rst_x;
reg[3:0]N;
wire[3:0]a;

// Clock generation
generate
if (RST_X == 1)
begin
    always #1 clk=~clk;
end
else
begin
    always #2 clk=~clk;
end
endgenerate

updcounter c2(a,clk,N,u_d,rst_x);

initial
begin
rst_x = 1'b1;
N = 4'b0111; // Set limit N=7
u_d = 1'b1; // Start counting up
clk = 0;
end

always #34 u_d=~u_d; // Change direction every 34 time units

initial $monitor
($time,"clk=%b, N=%d, u_d=%b, a=%d",clk,N,u_d,a); // Display values
initial #64 $stop; // Stop simulation
endmodule