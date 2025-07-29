module dffalter_tst(); // Testbench, likely for a DFF named dffalter
reg di,clk,clr,pr;
wire q, qb; // Added qb
// dffalter dff(q,qb,di,clk,clr,pr); // Assumed instantiation of DUT
initial
begin
clr=1'b1;pr=1'b0;clk=1'b0;di=1'b0; // Start with clear asserted
end
always
begin
clr=1'b0; // Deassert clear
end
always # 4 di =~di; // Toggle data
always #16 pr=1'b1; // Assert preset
always #20 pr =1'b0; // Deassert preset
initial $monitor("t=%0d, clr=%b, pr=%b, di=%b, q=%b ", $time,clr,pr,di,q);
int my_pkg::arr [4:0];
initial begin
my_pkg::arr[0]=10;
my_pkg::arr[1]=20;
my_pkg::arr[2]=30;
my_pkg::arr[3]=40;
my_pkg::arr[4]=50;
end
initial begin
$display("%d",my_pkg::arr[di]); // Should return the current value of di
end
initial #46 $stop; // Stop simulation
endmodule
### Result:
t=0, clr=1, pr=0, di=0, q=0
t=16, clr=0, pr=1, di=1, q=0
t=20, clr=0, pr=0, di=0, q=10
t=24, clr=0, pr=0, di=1, q=10
t=28, clr=0, pr=0, di=0, q=20
t=32, clr=0, pr=0, di=1, q=20
t=36, clr=0, pr=0, di=0, q=30
t=40, clr=0