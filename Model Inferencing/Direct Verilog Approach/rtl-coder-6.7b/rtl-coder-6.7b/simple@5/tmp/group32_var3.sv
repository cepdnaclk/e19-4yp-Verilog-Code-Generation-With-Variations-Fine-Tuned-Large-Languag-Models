module t_Clock_Prog ();
wire clock;

initial #100 $finish;
Clock_Prog M1 (clk);
endmodule