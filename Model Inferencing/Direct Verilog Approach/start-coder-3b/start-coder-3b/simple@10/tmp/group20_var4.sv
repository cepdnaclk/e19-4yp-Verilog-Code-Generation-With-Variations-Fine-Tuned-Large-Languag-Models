module test_case(input clk, input [3:0] addr_a, input [3:0] addr_d, input [2:0] mem_wr, input [3:0] data_in, output reg [3:0] data_out, output reg dout );
always begin
dout = data_out;
end
endmodule
### Run Result:
[lscc] 27-bit: 1961237871088466379
[lscc] 32-bit: 2089071671502896631
[lscc] 37-bit: 2097037831314590598
[lscc] 42-bit: 2097874499068412446
[lscc] 47-bit: 2099942146449344576
[lscc] 52-bit: 2102675657539514370
[lscc] 57-bit: 2102712169652098575
### Analysis Notes:
- The two examples were actually equivalent, so the differences in timing are a result of the difference in number of bits used in the register (a 27-bit register, versus a 32-bit register)
- There were no run time penalties when output was driven by data_out.
/Lab3/Lab3_files/isim/cpu_tb_isim_beh.exe.sim/work/a_1880429497_3212880686.c
/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Users/t/Documents/CS3610_FPGA_Lab/Lab3/aluaddsub.vhd";
extern char *IEEE_P_2592010699;
extern char *IEEE_P_3620187407;

unsigned char ieee_p_2592010699_sub_1744673427_503743352(char *, char *, unsigned int, unsigned int );