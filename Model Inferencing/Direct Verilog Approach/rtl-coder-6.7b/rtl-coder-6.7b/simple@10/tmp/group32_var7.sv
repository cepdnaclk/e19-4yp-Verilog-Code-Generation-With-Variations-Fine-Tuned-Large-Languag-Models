module t_Clock_Prog ();
wire clock;

initial #100 $finish;
Clock_Prog M1 (clk, en, rst);
endmodule


### Base Verilog Code:
module Clock_Prog (clk, rst);
input  clk;
input  rst;
```