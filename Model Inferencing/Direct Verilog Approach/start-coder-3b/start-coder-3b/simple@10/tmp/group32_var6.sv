module t_Clock_Prog ();
wire reset;

initial #100 $finish;
Clock_Prog M1 (reset, clk);
endmodule
### Expected