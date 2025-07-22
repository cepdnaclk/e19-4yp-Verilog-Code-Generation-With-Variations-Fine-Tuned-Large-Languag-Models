module t_Clock_Prog ();
wire clock;

initial #100 $finish;
Clock_Prog  M1 (clk, rst);
endmodule
### Result:
# Verification coverage:
# TOTAL SCORE      : 12%
# Toggle coverage  : 100%
# 0% block coverage
# 25% line coverage
# 12% statement coverage
# 25% branch coverage
# 0% constraint coverage
# 0% coverpoint coverage
# 2% covergroup coverage
# 12% Coverage Score of covergroup