`code/verilog/tst_mup.v`
### Actual Results:
`out/logs/tst_mup_out.log`
### Expected Results:
`out/logs/tst_mup_sol.log`
### Compare the Actual Results with Expected Results:
```bash
$ diff -y --suppress-common-lines \
out/logs/tst_mup_out.log\
out/logs/tst_mup_sol.log
```
### Simulation Logs:
```bash
$ cat out/logs/tst_mup_sol.log
# tst_mup_sol.log
clk=0, t=0, en=0, int=0, rr.pc=0, rr.ir=0, rr.dcop=0
clk=1, t=2, en=0, int=0, rr.pc=2, rr.ir=1, rr.dcop=0
clk=0, t=4, en=0, int=0, rr.pc=4, rr.ir=4, rr.dcop=0
clk=1, t=6, en=0, int=0, rr.pc=6, rr.ir=4, rr.dcop=0
clk=0, t=8, en=0, int=0, rr.pc=8, rr.ir=4, rr.dcop=0
clk=1, t=10, en=0, int=0, rr.pc=10, rr.ir=4, rr.dcop=0
clk=0, t=12, en=0, int=0, rr.pc=12, rr.ir=4, rr.dcop=0
clk=1, t=14, en=0, int=0, rr.pc=14, rr.ir=4, rr.dcop=0
clk=0, t=16, en=0, int=0, rr.pc=16, rr.ir=4, rr.dcop=0
clk=1, t=18, en=0, int=0, rr.pc=18, rr.ir=4, rr.dcop=0
clk=0, t=20, en=0, int=0, rr.pc=20, rr.ir=4, rr.dcop=0
clk=1, t=22, en=0, int=0, rr.pc=22, rr.ir=4, rr.dcop=0
clk=0, t=24, en=0, int=0, rr.pc=24, rr.ir=4, rr.dcop=0
clk=1, t=26, en=0, int=0, rr.pc=26, rr.ir=4, rr.dcop=0
clk=0, t=28, en=0, int=0, rr.pc=28, rr.ir=4, rr.dcop=0
clk=1, t=30, en=0, int=0, rr.pc=30, rr.ir=4, rr.dcop=0
clk=0, t=32, en=0, int=0, rr.pc=32, rr.ir=4, rr.dcop=0
clk=1, t=34, en=0, int=0, rr.pc=34, rr.ir=4, rr.dcop=0
clk=0, t=36, en=0, int=0, rr.pc=36, rr.ir=4, rr.dcop=0
clk=1, t=38, en=0, int=0, rr.pc=38, rr.ir=4, rr.dcop=0
clk=0, t=40, en=0, int=0, rr.pc=40, rr.ir=4, rr.dcop=0
clk=1, t=42, en=0, int=0, rr.pc=42, rr.ir=4, rr