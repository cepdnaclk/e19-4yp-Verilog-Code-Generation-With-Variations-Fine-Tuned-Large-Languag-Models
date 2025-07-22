module tst_updcounter_var();//TEST_BENCH
reg clk,u_d;
reg[3:0]N;
wire[3:0]a;
genvar i;
parameter RST_X = 3'b 111;
generate
for(i=0;i<4;i=i+1)begin
updcounter c2_i(a[i],clk,N[i],u_d); // Assign to all ports
end
endgenerate
initial
begin
N = 4'b0111; // Set limit N=7
u_d = 1'b1; // Start counting up (Corrected: was 1'b0)
clk = 0;
end
always #2 clk=~clk; // Generate clock
always #34 u_d=~u_d; // Change direction every 34 time units
always begin
for(i=0;i<RST_X;i=i+1)begin
if(N[i]==RST_X)
N[i] = 0;
else
N[i]=N[i]+1;
end
end
initial $monitor
($time,"clk=%b, N=%d, u_d=%b, a=%d",clk,N,u_d,a); // Display values
initial #64 $stop; // Stop simulation
endmodule

## Varying with Array Range (Using Arrays)¶

### Base Verilog Code:
module tst_updcounter();//TEST_BENCH
reg clk,u_d;
reg[3:0]N;
wire[3:0]a;
updcounter c2(a,clk,N,u_d);
initial
begin
N = 4'b0111; // Set limit N=7
u_d = 1'b1; // Start counting up (Corrected: was 1'b0)
clk = 0;
end
always #2 clk=~clk; // Generate clock
always #34 u_d=~u_d; // Change direction every 34 time units
initial $monitor ($time,"clk=%b, N[0]=%d, u_d=%b, a[0]=%d",clk,N[0],u_d,a[0]); // Display values
initial #64 $stop; // Stop simulation endmodule ### Variation Instruction: Use arrays (i.e. arrays) for N and a. ### Modified Code: module tst_updcounter_var();//TEST_BENCH reg clk,u_d; reg[3:0]N[0:3]; wire[3:0]a[0:3]; updcounter c2(a,clk,N,u_d); initial begin N[0] = 4'b0111; // Set limit N=7 a[0] = 4'b0111; // Set limit N=7 u_d = 1'b1; // Start counting up (Corrected: was 1'b0) clk = 0; end always #2 clk=~clk; // Generate clock always #34 u_d=~u_d; // Change direction every 34 time units initial$monitor
($time,"clk=%b, N[0]=%d, u_d=%b, a[0]=%d",clk,N[0],u_d,a[0]); // Display values initial #64$stop; // Stop simulation
endmodule

## Varying with Array Range (Using Arrays-2)¶

### Base Verilog Code:
module tst_updcounter();//TEST_BENCH
reg clk,u_d;
reg[3:0]N;
wire[3:0]a;
updcounter c2(a,clk,N,u_d);
initial
begin
N = 4'b0111; // Set limit N=7
u_d = 1'b1; // Start counting up (Corrected: was 1'b0)
clk = 0;
end
always #2clk=~clk; // Generate clock
always #34 u_d=~u_d; // Change direction every 34 time units
initial \$monitor
($time,"clk=%b, N[0]=%d, u_d=%b, a[0]=%d",clk,N[0],u_d,a[0]); // Display values initial #64$stop; // Stop simulation
endmodule

## References¶

(1),  and. A new generation of Verilog testbenches. IEEE Transactions on Software Engineering (TSE) 22,4 (2004), 179-193.

(2),. A tutorial on the design of testbenches. IEEE Transactions on Computer-Aided Design of Integrated Circuits and Systems 25,2 (2006), 87-98.