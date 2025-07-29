module tst_dff_pbeh();
  logic di,clk; wire do; // Change to logic here
  dff_p d1(do,di,clk); // Instantiate DFF with path delay
  initial begin clk=0; di=1'b0; #35 $stop; end // Initialize & stop
  always #3 clk=~clk; // Generate clock (negedges at 6, 12, 18...)
  always #5 di=~di; // Toggle data
  initial $monitor($time,"clk=%b, di=%b, do=%b",clk,di,do);
endmodule
### Simulation Log:
0 clk=0, di=0, do=x
1 clk=1, di=0, do=0
2 clk=0, di=0, do=0
3 clk=1, di=0, do=x
4 clk=0, di=0, do=0
5 clk=1, di=0, do=0
6 clk=0, di=0, do=0
7 clk=1, di=0, do=0
8 clk=0, di=0, do=0
9 clk=1, di=0, do=0
10 clk=0, di=0, do=0
11 clk=1, di=0, do=0
12 clk=0, di=0, do=0
13 clk=1, di=0, do=0
14 clk=0, di=0, do=0
15 clk=1, di=0, do=x
16 clk=0, di=0, do=0
17 clk=1, di=0, do=0
18 clk=0, di=0, do=0
19 clk=1, di=0, do=0
20 clk=0, di=0, do=0
21 clk=1, di=0, do=0
22 clk=0, di=0, do=0
23 clk=1, di=0, do=x
24