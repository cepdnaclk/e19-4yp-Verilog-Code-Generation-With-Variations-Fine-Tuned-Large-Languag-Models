module tst_ctr_wt;
reg clk,En;
reg[3:0]N;
wire[3:0]a;
generate
for (int i=15; i>=0; i=i-1)
wire a_i = $bits(a,i);  // Nested generate block
// Use an inside operator for range selection
ctr_wt c1(i:a,clk,N,En);
endgenerate
initial
begin
clk=0; N=4'b1111; // Set limit to 15
En=1'b0; // Start disabled
end
always begin $stop end
initial $monitor($time,"clk=%b, En=%b, N=%b, a=%b",clk,En,N,a); // Corrected format specifiers
endmodule
### Test File:
import vunit;
class test_ctr_wt extends vunit.VUnitTest;
procedure check_ctr_wt;
reg En, clk;
reg[3:0] N;
reg[3:0] a;
model m1 = new tst_ctr_wt;
function check_ctr_wt;
check(clk=1'b1,En=1'b1,N=4'b1000,a=4'b0000);
check(clk=1'b0,En=1'b1,N=4'b1111,a=4'b0000);
check(clk=1'b0,En=1'b0,N=4'b1111,a=4'b0000);
check(clk=1'b0,En=1'b1,N=4'b1111,a=4'b0001);
check(clk=1'b0,En=1'b1,N=4'b1111,a=4'b0000);
check(clk=1'b0,En=1'b1,N=4'b1111,a=4'b0010);
check(clk=1'b0,En=1'b1,N=4'b1111,a=4'b0000);
check(clk=1'b0,En=1'b1,N=4'b1111,a=4'b0100);
check(clk=1'b0,En=1'b1,N=4'b1111,a=4'b0000);
check(clk=1'b0,En=1'b1,N=4'b1111,a=4'b1000);
check(clk=1'b0,En=1'b1,N=4'b1111,a=4'b0000);
check(clk=1'b0,En=1'b1,N=4'b1111,a=4'b0000);
check(clk=1'b0,En=1'b1,N=4'b1111,a=4'b0000);
check(clk=1'b0,En=1'b1,N=4'b1111,a=4'b0000);
check(clk=1'b0,En=1'b1,N=4'b1111,a=4'b0000);
endfunction
procedure run;
assert(check_ctr_wt);
endprocedure
begin
setup();
run();
end
endclass
### Expected Output:
10000111100000000000000000000000
...
### Verifications:
The test program does not fail.
### Reference URL:
https://stackoverflow.com/questions/55021260/how-to-access-a-sub-element-of-a-generate-block-in-verilog-2001-escaped-names/55023813#55023813

#### 

Joined:
Jan 4, 2015
Messages:
2,019
Location:
Beijing, China
I think you can use a verilog macro to solve this problem, just like:

module tst_ctr_wt;
reg clk,En;
reg[3:0]N;
wire[3:0]a;
#define ctr_wt(i) a##i c1##i(i:a,clk,N,En);
ctr_wt(0)
ctr_wt(1)
...
endmodule

#### 

Joined:
Jan 4, 2015
Messages:
2,019
Location:
Beijing, China
The method you just posted should work too.

#### 

Joined:
Jan 4, 2015
Messages:
2,019
Location:
Beijing, China
The test is still right. I think the problem is the way to display the result. For example, a should be 0001 while the test expects 0000. The test is wrong because it expects 0000 instead of 1.

#### 

Joined:
Jan 4, 2015
Messages:
2,019
Location:
Beijing, China
You can use \b (binary) and \d (decimal) to display the bits like this:

$monitor("clk=%b, En=%b, N=%b, a=%d", clk, En, N, a); The reason is that the output of a is a 4-bit binary number instead of a decimal number. The result is still correct. ####  Joined: Jan 4, 2015 Messages: 2,019 Location: Beijing, China The verilog program does not stop. This is caused by the output monitor. As I mentioned above, the output of a is a bit vector instead of a decimal number. So you can use another output monitor to check the bits of a. And the test is still right. ####  Joined: Jan 4, 2015 Messages: 2,019 Location: Beijing, China You can also use this form: $display("%b %d", clk, En, N, a);

#### 

Joined:
Jan 4, 2015
Messages:
2,019
Location:
Beijing, China
It's not recommended to use the $display command in the simulation. It should be used for post-simulation data processing. ####  Joined: Jan 4, 2015 Messages: 2,019 Location: Beijing, China I think you can use a verilog macro to solve this problem, just like: module tst_ctr_wt; reg clk,En; reg[3:0]N; wire[3:0]a; #define ctr_wt(i) a##i c1##i(i:a,clk,N,En); ctr_wt(0) ctr_wt(1)... endmodule The test is still right. I think the problem is the way to display the result. For example, a should be 0001 while the test expects 0000. The test is wrong because it expects 0000 instead of 1. ####  Joined: Jan 4, 2015 Messages: 2,019 Location: Beijing, China The test is still right. I don't think it's wrong. In the test, clk = 1'b0 and En = 1'b1. So the test's result of a is 0000. ####  Joined: Jan 4, 2015 Messages: 2,019 Location: Beijing, China The verilog program does not stop. This is caused by the output monitor. As I mentioned above, the output of a is a bit vector instead of a decimal number. So you can use another output monitor to check the bits of a. And the test is still right. ####  Joined: Jan 4, 2015 Messages: 2,019 Location: Beijing, China You can also use this form: $display("%b %d", clk, En, N, a);

#### 

Joined:
Jan 4, 2015
Messages:
2,019
Location:
Beijing, China
It's not recommended to use the $display command in the simulation. It should be used for post-simulation data processing. ####  Joined: Jan 4, 2015 Messages: 2,019 Location: Be