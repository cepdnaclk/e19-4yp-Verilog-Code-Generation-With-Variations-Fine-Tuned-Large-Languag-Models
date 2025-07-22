```
module tst_ctr_wt;
reg clk,En;
reg[3:0]N;
wire[3:0]a;

generate
  genvar i;
  parameter  N = '{4'b1111, 4'b0000, 4'b0001, 4'b0001, 4'b0010};
  parameter  En = '{4'b1, 4'b1, 4'b1, 4'b1, 4'b1};
  generate
    initial $monitor($time,"clk=%b, En=%b, N=%d, a=%d",clk,En,N,a); // Corrected format specifiers
  endgenerate
endgenerate

ctr_wt c1(a,clk,N,En);

always
initial #35 $stop; // Stop simulation
endmodule
```
### Base Verilog Code:
```
module tst_ctr_wt