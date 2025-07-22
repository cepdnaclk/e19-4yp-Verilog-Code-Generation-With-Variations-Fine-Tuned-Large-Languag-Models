module example4(x1, x2, x3, x4, f, g, h);
input x1, x2, x3, x4;
output f, g, h;
reg f_out_0, f_out_1, f_out_2, f_out_3;
always @* begin
f_out_0 = 0;
f_out_1 = 0;
f_out_2 = 0;
f_out_3 = 0;
#2
f_out_0 = 1;
f_out_1 = 0;
f_out_2 = 0;
f_out_3 = 0;
#2
f_out_0 = 1;
f_out_1 = 1;
f_out_2 = 0;
f_out_3 = 0;
#2
f_out_0 = 1;
f_out_1 = 1;
f_out_2 = 1;
f_out_3 = 0;
end
assign g = (x1 & x3) | (x2 & x4);
assign h = (x1 | x3) & (x2 | x4);
assign f = g | h;
endmodule
### Testing Results
```
[Info] Output file: /tmp/vvp-4517cb.fst
[Info] Finished simulation for 500 seeds.
[Info] Seed 1
[Info] Fst-dump file for seed 1: /home/user/verilator/FST-Sim/vvp-4517cb_seed1.fst
[Info] Seed 2
[Info] Fst-dump file for seed 2: /home/user/verilator/FST-Sim/vvp-4517cb_seed2.fst
[Info] Seed 3
[Info] Fst-dump file for seed 3: /home/user/verilator/FST-Sim/vvp-4517cb_seed3.fst
[Info] Seed 4
[Info] Fst-dump file for seed 4: /home/user/verilator/FST-Sim/vvp-4517cb_seed4.fst
[Info] Seed 5
[Info] Fst-dump file for seed 5: /home/user/verilator/FST-Sim/vvp-4517cb_seed5.fst
[Info] Seed 6
[Info] Fst-dump file for seed 6: /home/user/verilator/FST-Sim/vvp-4517cb_seed6.fst
[Info] Seed 7
[Info] Fst-dump file for seed 7: /home/user/verilator/FST-Sim/vvp-4517cb_seed7.fst
[Info] Seed 8
[Info] Fst-dump file for seed 8: /home/user/verilator/FST-Sim/vvp-4517cb_seed8.fst
[Info] Seed 9
[Info] Fst-dump file for seed 9: /home/user/verilator/FST-Sim/vvp-4517cb_seed9.fst
[Info] Seed 10
[Info] Fst-dump file for seed 10: /home/user/verilator/FST-Sim/vvp-4517cb_seed10.fst
[Info] Seed 11
[Info] Fst-dump file for seed 11: /home/user/verilator/FST-Sim/vvp-4517cb_seed11.fst
[Info] Seed 12
[Info] Fst-dump file for seed 12: /home/user/verilator/FST-Sim/vvp-4517cb_seed12.fst
[Info] Seed 13
[Info] Fst-dump file for seed 13: /home/user/verilator/FST-Sim/vvp-4517cb_seed13.fst
[Info] Seed 14
[Info] Fst-dump file for seed 14: /home/user/verilator/FST-Sim/vvp-4517cb_seed14.fst
[Info] Seed 15
[Info] Fst-dump file for seed 15: /home/user/verilator/FST-Sim/vvp-4517cb_seed15.fst
[Info] Seed 16
[Info] Fst-dump file for seed 16: /home/user/verilator/FST-Sim/vvp-4517cb_seed16.fst
[Info] Seed 17
[Info] Fst-dump file for seed 17: /home/user/verilator/FST-Sim/vvp-4517cb_seed17.fst
[Info] Seed 18
[Info] Fst-dump file for seed 18: /home/user/verilator/FST-Sim/vvp-4517cb_seed18.fst
[Info] Seed 19
[Info] Fst-dump file for seed 19: /home/user/verilator/FST-Sim/vvp-4517cb_seed19.fst
[Info] Seed 20
[Info] Fst-dump file for seed 20: /home/user/verilator/FST-Sim/vvp-4517cb_seed20.fst
[Info] Seed 21
[Info] Fst-dump file for seed 21: /home/user/verilator/FST-Sim/vvp-4517cb_seed21.fst
[Info] Seed 22
[Info] Fst-dump file for seed 22: /home/user/verilator/FST-Sim/vvp-4517cb_seed22.fst
[Info] Seed 23
[Info] Fst-dump file for seed 23: /home/user/verilator/FST-Sim/vvp-4517cb_seed23.fst
[Info] Seed 24
[Info] Fst-dump file for seed 24: /home/user/verilator/FST-Sim/vvp-4517cb_seed24.fst
[Info] Seed 25
[Info] Fst-dump file for seed 25: /home/user/verilator/FST-Sim/vvp-4517cb_seed25.fst
[Info] Seed 26
[Info] Fst-dump file for seed 26: /home/user/verilator/FST-Sim/vvp-4517cb_seed26.fst
[Info] Seed 27
[Info] Fst-dump file for seed 27: /home/user/verilator/FST-Sim/vvp-4517cb_seed27.fst
[Info] Seed 28
[Info] Fst-dump file for seed 28: /home/user/verilator/FST-Sim/vvp-4517cb_seed28.fst
[Info] Seed 29
[Info] Fst-dump file for seed 29: /home/user/verilator/FST-Sim/vvp-4517cb_seed29.fst
[Info] Seed 30
[Info] Fst-dump file for seed 30: /home/user/verilator/FST-Sim/vvp-4517cb_seed30.fst
[Info] Seed 31
[Info] Fst-dump file for seed 31: /home/user/verilator/FST-Sim/vvp-4517cb_seed31.fst
[Info] Seed 32
[Info] Fst-dump file for seed 32: /home/user/verilator/FST-Sim/vvp-4517cb_seed32.fst
[Info] Seed 33
[Info] Fst-dump file for seed 33: /home/user/verilator/FST-Sim/vvp-4517cb_seed33.fst
[Info] Seed 34
[Info] Fst-dump file for seed 34: /home/user/verilator/FST-Sim/vvp-4517cb_seed34.fst
[Info] Seed 3