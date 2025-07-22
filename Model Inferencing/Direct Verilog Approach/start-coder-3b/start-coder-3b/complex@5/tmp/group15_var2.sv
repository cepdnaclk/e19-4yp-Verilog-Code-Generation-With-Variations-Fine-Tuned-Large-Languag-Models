module tst_updcounter(RST_X,RST_Y,RST_Z); //TEST_BENCH
reg clk;
reg[3:0] N;
wire[3:0] a;
updcounter c2(a,clk,N,RST_X,RST_Y,RST_Z); //RST_X,RST_Y,RST_Z are defined in the external file
initial
begin
// 	// Set limit N=7
// 	N = 4'b0111; // Set limit N=7
// 	// Start counting up (Corrected: was 1'b0)
	N = RST_X; 	//Set N value
	u_d = RST_Y;	//Set clk direction 0 for up and 1 for down
	clk = RST_Z;	//Set clock generation
end
always #2 clk=~clk; // Generate clock
always #34 u_d=~u_d; // Change direction every 34 time units
initial $monitor
($time,"clk=%b, N=%d, u_d=%b, a=%d",clk,N,u_d,a); // Display values
initial #64 $stop; // Stop simulation
endmodule
### Testbench:
module tb_tst_updcounter(RST_X,RST_Y,RST_Z);
reg clk;
reg[3:0] N;
wire[3:0] a;
updcounter c2(a,clk,N,RST_X,RST_Y,RST_Z);
initial
begin
N = RST_X; 	//Set N value
u_d = RST_Y;	//Set clk direction 0 for up and 1 for down
clk = RST_Z;	//Set clock generation
$display ("Initial Values: RST_X=%d, RST_Y=%d, RST_Z=%d, clk=%b, N=%d, u_d=%d, a=%d ",RST_X,RST_Y,RST_Z,clk,N,u_d,a);//Display values
initial $monitor
($time,"clk=%b, N=%d, u_d=%d, a=%d",clk,N,u_d,a); // Display values
initial #1000 $finish; // Stop simulation
end
endmodule
### Run Code:
`ncverilog -f tst_updcounter.f -sv tst_updcounter.sv tb_tst_updcounter.sv`
### Result:
`ncverilog -f tst_updcounter.f -sv tst_updcounter.sv tb_tst_updcounter.sv`

> Initial Values: RST_X=1, RST_Y=0, RST_Z=1, clk=1, N=1, u_d=0, a=0
> 1000.000000 ns: clk=0, N=1, u_d=0, a=0
> 2000.000000 ns: clk=1, N=1, u_d=0, a=0
> 3000.000000 ns: clk=0, N=1, u_d=0, a=0
> 4000.000000 ns: clk=1, N=1, u_d=0, a=0
> 5000.000000 ns: clk=0, N=1, u_d=0, a=0
> 6000.000000 ns: clk=1, N=1, u_d=0, a=0
> 7000.000000 ns: clk=0, N=1, u_d=0, a=0
> 8000.000000 ns: clk=1, N=1, u_d=0, a=0
> 9000.000000 ns: clk=0, N=1, u_d=0, a=0
> 10000.000000 ns: clk=1, N=1, u_d=0, a=0
> 11000.000000 ns: clk=0, N=1, u_d=0, a=0
> 12000.000000 ns: clk=1, N=1, u_d=0, a=0
> 13000.000000 ns: clk=0, N=1, u_d=0, a=0
> 14000.000000 ns: clk=1, N=1, u_d=0, a=0
> 15000.000000 ns: clk=0, N=1, u_d=0, a=0
> 16000.000000 ns: clk=1, N=1, u_d=0, a=0
> 17000.000000 ns: clk=0, N=1, u_d=0, a=0
> 18000.000000 ns: clk=1, N=1, u_d=0, a=0
> 19000.000000 ns: clk=0, N=1, u_d=0, a=0
> 20000.000000 ns: clk=1, N=1, u_d=0, a=0
> 21000.000000 ns: clk=0, N=1, u_d=0, a=0
> 22000.000000 ns: clk=1, N=1, u_d=0, a=0
> 23000.000000 ns: clk=0, N=1, u_d=0, a=0
> 24000.000000 ns: clk=1, N=1, u_d=0, a=0
> 25000.000000 ns: clk=0, N=1, u_d=0, a=0
> 26000.000000 ns: clk=1, N=1, u_d=0, a=0
> 27000.000000 ns: clk=0, N=1, u_d=0, a=0
> 28000.000000 ns: clk=1, N=1, u_d=0, a=0
> 29000.000000 ns: clk=0, N=1, u_d=0, a=0
> 30000.000000 ns: clk=1, N=1, u_d=0, a=0
> 31000.000000 ns: clk=0, N=1, u_d=0, a=0
> 32000.000000 ns: clk=1, N=1, u_d=0, a=0
> 33000.000000 ns: clk=0, N=1, u_d=0, a=0
> 34000.000000 ns: clk=1, N=1, u_d=0, a=0
> 35000.000000 ns: clk=0, N=1, u_d=0, a=0
> 36000.000000 ns: clk=1, N=1, u_d=0, a=0
> 37000.000000 ns: clk=0, N=1, u_d=0, a=0
> 38000.000000 ns: clk=1, N=1, u_d=0, a=0
> 39000.000000 ns: clk=0, N=1, u_d=0, a=0
> 40000.000000 ns: clk=1, N=1, u_d=0, a=0
> 41000.000000 ns: clk=0, N=1, u_d=0, a=0
> 4200