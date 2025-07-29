module tst_ctr_wt;
reg clk,En;
reg[3:0]N;
wire[3:0]a;
ctr_wt c1(a,clk,N,En);
initial
begin
clk=0; N=4'b1111; // Set limit to 15
En=1'b0; // Start disabled
end
always
initial #35 $stop; // Stop simulation
initial $monitor($time,"clk=%b, En=%b, N=%d, a=%d",clk,En,N,a); // Corrected format specifiers
endmodule
### Expected Output for Verification:
```
**WARNING:** Outputs truncated for clarity.

```
# clk=0, En=0, N=15, a=0
# clk=1, En=0, N=15, a=1
# clk=0, En=0, N=15, a=0
# clk=1, En=0, N=15, a=1
# clk=0, En=0, N=15, a=2
# clk=1, En=0, N=15, a=3
# clk=0, En=0, N=15, a=2
# clk=1, En=0, N=15, a=3
# clk=0, En=0, N=15, a=4
# clk=1, En=0, N=15, a=5
# clk=0, En=0, N=15, a=4
# clk=1, En=0, N=15, a=5
# clk=0, En=0, N=15, a=6
# clk=1, En=0, N=15, a=7
# clk=0, En=0, N=15, a=6
# clk=1, En=0, N=15, a=7
# clk=0, En=0, N=15, a=8
# clk=1, En=0, N=15, a=9
# clk=0, En=0, N=15, a=8
# clk=1, En=0, N=15, a=9
# clk=0, En=0, N=15, a=10
# clk=1, En=0, N=15, a=11
# clk=0, En=0, N=15, a=10
# clk=1, En=0, N=15, a=11
# clk=0, En=0, N=15, a=12
# clk=1, En=0, N=15, a=13
# clk=0, En=0, N=15, a=12
# clk=1, En=0, N=15, a=13
# clk=0, En=0, N=15, a=14
# clk=1, En=0, N=15, a=15
# clk=0, En=0, N=15, a=14
# clk=1, En=0, N=15, a=15
```
### Expected Output for Verification:
```
# clk=0, En=0, N=15, a=0
# clk=1, En=0, N=15, a=1
# clk=0, En=0, N=15, a=0
# clk=1, En=0, N=15, a=1
# clk=0, En=0, N=15, a=2
# clk=1, En=0, N=15, a=3
# clk=0, En=0, N=15, a=2
# clk=1, En=0, N=15, a=3
# clk=0, En=0, N=15, a=4
# clk=1, En=0, N=15, a=5
# clk=0, En=0, N=15, a=4
# clk=1, En=0,