module updcounter();
parameter WIDTH = 4;
parameter MAX = 8;
//reg[WIDTH-1:0][MAX-1:0] a_mem [0:11];
reg[WIDTH-1:0][MAX-1:0] a_mem [0:7];
reg[WIDTH-1:0] N;
reg u_d; // Up or down flag
reg[WIDTH-1:0] a_reg; // Register used in increment/decrement
input clk;
input rst_x;
input rst_i;
output reg[WIDTH-1:0] a;
always @(posedge clk or posedge rst_x) begin
if (rst_i) begin
a_mem[N-1:0] <= (N-1) {1'b0, 1'b0, 1'b0};
N <= (WIDTH) {N[WIDTH-1:0], 1'b0};
end
else begin
if (u_d) // Increment register
a_reg <= a_reg + 1'b1; // Increment
// Generate address
else
a_reg <= a_reg - 1'b1; // Decrement
// Generate address
a_mem[N-1:0] <= a_reg;
if (u_d && a_reg == (N-1))
N <= N + 1; // Increase limit
if (!u_d && a_reg == 0)
N <= N - 1; // Decrease limit
end
// Generate output signal
a <= a_mem[N-1];
end
endmodule


I've tested the above code with this testbench code:

module tst_updcounter();
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
initial $monitor ($time,"clk=%b, N=%d, u_d=%b, a=%d",clk,N,u_d,a); // Display values
initial #64 $stop; // Stop simulation endmodule  The behavior should be "counter" but the output is 0. What part of the code/architecture is incorrect or inappropriate? • I do not see a problem with the top level code, but I'm not certain about the bottom level code. – user28715 Aug 30 '13 at 20:46 • @user28715: In general, the bottom level code should work as well. Are you sure you have your input signal assignments correct? – TonyM Aug 30 '13 at 20:47 • Please post your code as text. No images. –. Aug 30 '13 at 23:11 • @TonyM: It would be simpler if I modified my code in the question. It seems the initial values for u_d and a_mem are the issue. It works with initial values of 0 as u_d and a_mem. – user28715 Aug 30 '13 at 23:15 • @user28715: The values of u_d and a_mem are not the issue. The problem is that the clock is not gating correctly. I've re-written the code to simplify the structure and address the issue. Please verify that the code works as you desire. – TonyM Aug 30 '13 at 23:35 ## 1 Answer Here are some comments: 1. You do not need to have the rst_x and rst_i signals. I don't see any reason to have them. 2. There is no point in the generate block. It is going to give you the same result as your if-else statement. I've removed the generate block and you still get the results you want. 3. The first time you run the simulation, it's going to start at 0 and then go up because u_d is true. It's going to be 0000 by the time you hit the first 34 time steps. It's going to take a minute for it to go up to 1111, then it will go to 0000 again because u_d is false. However, when it hits 1111, it will never go down because u_d is false. I would try to make your code a little more complicated so you can see what's going. • 1. I agree on not needing those. – TonyM Aug 30 '13 at 23:50 • 2. I am wondering if this is a problem with the code from the question or my understanding of the question. – user28715 Aug 30 '13 at 23:51 • 3. I've modified the testbench code and it works. I don't understand how to make it work. – user28715 Aug 30 '13 at 23:53 • I edited my answer as I found out that the clock was not gating properly. – TonyM Aug 30 '13 at 23:59 • @user28715: I have edited the code to address the issues you mentioned. Please verify that it works as you desired. – TonyM Aug 31 '13 at 0:01 • OK. I see it. That makes sense. – user28715 Aug 31 '13 at 1:44 I don't see any problem with the top level code, but I'm not certain about the bottom level code. What part of the code/architecture is incorrect or inappropriate? Well, the architecture is correct but the behavior is not. At the top level, the behavior is as expected. Here is a modified version of your code: module updcounter(); parameter WIDTH = 4; parameter MAX = 8; reg[WIDTH-1:0][MAX-1:0] a_mem [0:7]; reg[WIDTH-1:0] N; reg u_d; // Up or down flag reg[WIDTH-1:0] a_reg; // Register used in increment/decrement input clk; input rst_x; input rst_i; output reg[WIDTH-1:0] a; always @(posedge clk or posedge rst_x) begin if (rst_i) begin a_mem[N-1:0] <= (N-1) {1'b0, 1'b0, 1'b0}; N <= (WIDTH) {N[WIDTH-1:0], 1'b0}; end else begin if (u_d) // Increment register a_reg <= a_reg + 1'b1; // Increment // Generate address else a_reg <= a_reg - 1'b1; // Decrement // Generate address a_mem[N-1:0] <= a_reg; if (u_d && a_reg == (N-1)) N <= N + 1; // Increase limit if (!u_d && a_reg == 0) N <= N - 1; // Decrease limit end end // Generate output signal a <= a_mem[N-1]; end endmodule The behavior is not changed if I use an initial value of 4'b0111 for N and a_reg = 0. The output is still 0. But the behavior is changed if N is initialized to 0 and a_reg is initialized to 3. The output is now 3. I don't know what is the problem. How should I modify the code? Please help! • I think the problem is with the initialization of a_reg. I suggest you use $random for this purpose, since it is not necessary to have a value of 3 for testing. –  Aug 31 '13 at 2:13
• I see what you mean. The problem is a_reg is not initialized properly. It should be 0. – user28715 Aug 31 '13 at 14:50
• @user28715: That is true. But this is incorrect. You can initialize a_reg to any number. It is a_reg = (WIDTH) {WIDTH[WIDTH-1:0], 1'b0}; – TonyM Aug 31 '13 at 14:53
• @user28715: This is a bug in FPGA design. There is a timing constraint called "setup" which limits the delay between the assertion of the reset signal and the assertion of the clock signal. This timing constraint is different from the clock period. The reset signal is sampled at the end of the clock period. When you initialize a register