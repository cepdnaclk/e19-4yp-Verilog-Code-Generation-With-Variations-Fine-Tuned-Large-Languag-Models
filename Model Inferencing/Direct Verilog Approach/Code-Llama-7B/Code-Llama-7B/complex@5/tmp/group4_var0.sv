```verilog
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
begin
#35 $stop; // Stop simulation
$monitor($time,"clk=%b, En=%b, N=%d, a=%d",clk,En,N,a); // Corrected format specifiers
end
endmodule
```
### Expected Result:
```
> ghdl -r tst_ctr_wt --ieee=synopsys
ghdl -r tst_ctr_wt --ieee=synopsys

--  CLK=0, En=0, N=15, a=0
--  CLK=1, En=0, N=15, a=0
--  CLK=0, En=0, N=15, a=1
--  CLK=1, En=0, N=15, a=1
--  CLK=0, En=0, N=15, a=2
--  CLK=1, En=0, N=15, a=2
--  CLK=0, En=0, N=15, a=3
--  CLK=1, En=0, N=15, a=3
--  CLK=0, En=0, N=15, a=4
--  CLK=1, En=0, N=15, a=4
--  CLK=0, En=0, N=15, a=5
--  CLK=1, En=0, N=15, a=5
--  CLK=0, En=0, N=15, a=6
--  CLK=1, En=0, N=15, a=6
--  CLK=0, En=0, N=15, a=7
--  CLK=1, En=0, N=15, a=7
--  CLK=0, En=0, N=15, a=8
--  CLK=1, En=0, N=15, a=8
--  CLK=0, En=0, N=15, a=9
--  CLK=1, En=0, N=15, a=9
--  CLK=0, En=0, N=15, a=10
--  CLK=1, En=0, N=15, a=10
--  CLK=0, En=0, N=15, a=11
--  CLK=1, En=0, N=15, a=11
--  CLK=0, En=0, N=15, a=12
--  CLK=1, En=0, N=15, a=12
--  CLK=0, En=0, N=15, a=13
--  CLK=1, En=0, N=15, a=13
--  CLK=0, En=0, N=15, a=14
--  CLK=1, En=0, N=15, a=14
--  CLK=0, En=0, N=15, a=15
--  CLK=1, En=0, N=15, a=15
--  CLK=0, En=1, N=15, a=0
--  CLK=1, En=1, N=15, a=1
--  CLK=0, En=1, N=15, a=2
--  CLK=1, En=1, N=15, a=3
--  CLK=0, En=1, N=15, a=4
--  CLK=1, En=1, N=15, a=5
--  CLK=0, En=1, N=15, a=6
--  CLK=1, En=1, N=15, a=7
--  CLK=0, En=1, N=15