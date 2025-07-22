module tst_dff_pbeh();
  logic di,clk; wire do;
  dff_p d1(do,di,clk);
### Simulation result:
```
[0.000000] clk=0, di=0, do=0
[3.000000] clk=1, di=1, do=0
[6.000000] clk=0, di=1, do=1
[9.000000] clk=1, di=0, do=1
[12.000000] clk=0, di=0, do=0
[15.000000] clk=1, di=1, do=0
[18.000000] clk=0, di=1, do=1
[21.000000] clk=1, di=0, do=1
[24.000000] clk=0, di=0, do=0
[27.000000] clk=1, di=1, do=0
[30.000000] clk=0, di=1, do=1
[33.000000] clk=1, di=0, do=1
[36.000000] clk=0, di=0, do=0
[39.000000] clk=1, di=1, do=0
[42.000000] clk=0, di=1, do=1
[45.000000] clk=1, di=0, do=1
[48.000000] clk=0, di=0, do=0
[51.000000] clk=1, di=1, do=0
[54.000000] clk=0, di=1, do=1
[57.000000] clk