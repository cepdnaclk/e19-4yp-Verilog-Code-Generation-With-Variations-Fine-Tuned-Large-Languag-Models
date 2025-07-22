module counter(clk, rst, q);
input clk;
input rst;
output q;
reg q;
initial
q = 0;
always @(posedge clk or posedge rst)
if(rst)
$finish;
else
q = q + 1;
endmodule
### Results of Synthesis:
![10.png](attachment:10.png)/lab-3/lab-3/isim/reg_testbench_isim_beh.exe.sim/work/m_00000000000248957200_2079936092.c
/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx