module par_packed(in, par, all_ones);
input [3:0] in1,in2,in3,in4;
output par,all_ones;
wire par1,par2,par3,par4;
assign par = in1 ^ in2;
assign par4 = in1 & in2;
assign par3 = in1 | in2;
assign par2 = in1 ^ in3;
assign par1 = in1 & in3;
assign all_ones = in1 & in2 & in3 & in4;
endmodule
### Testbench:
module tb_par_packed;
reg [3:0] in1,in2,in3,in4;
reg par, all_ones;
par_packed inst_par_packed (.in1 (in1[0]),.in2 (in1[1]),.in3 (in1[2]),.in4 (in1[3]),.par(par),.all_ones(all_ones));
initial begin
in1 = 5'b1010;
in2 = 5'b1011;
in3 = 5'b1101;
in4 = 5'b1110;
end
endmodule
### Simulation:
![image](https://user-images.githubusercontent.com/68240004/121687570-04921e00-cab8-11eb-9229-8c811d373108.png)
/1809050/Assignment_4/Lab_4_Task_05/Lab_4_Task_05/isim/tb_test_isim_beh.exe.sim/work/a_0375707084_3212880686.c
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
static unsigned int ng0[] = {213U, 0U};
static unsigned int ng1[] = {2U, 0U};
static int ng2[] = {4, 0};
static int ng3[] = {3, 0};
static int ng4[] = {2, 0};
static int ng5[] = {1, 0};
static unsigned int ng6[] = {0U, 0U};
static unsigned int ng7[] = {31U, 0U};
static unsigned int ng8[] = {30U, 0U};
static unsigned int ng9[] = {29U, 0U};
static unsigned int ng10[] = {28U, 0U};
static unsigned int ng11[] = {27U, 0U};
static unsigned int ng12[] = {26U, 0U};
static unsigned int ng13[] = {25U, 0U};
static unsigned int ng14[] = {24U, 0U};
static unsigned int ng15[] = {23U, 0U};
static unsigned int ng16[] = {22U, 0U};
static unsigned int ng17[] = {21U, 0U};
static unsigned int ng18[] = {20U, 0U};
static unsigned int ng19[] = {19U, 0U};
static unsigned int ng20[] = {18U, 0U};
static unsigned int ng21[] = {17U, 0U};
static unsigned int ng22[] = {16U, 0U};
static unsigned int ng23[] = {15U, 0U};
static unsigned int ng24[] = {14U, 0U};
static unsigned int ng25[] = {13U, 0U};
static unsigned int ng26[] = {12U, 0U};
static unsigned int ng27[] = {11U, 0U};
static unsigned int ng28[] = {10U, 0U};
static unsigned int ng29[] = {9U, 0U};
static unsigned int ng30[] = {8U, 0U};
static unsigned int ng31[] = {7U, 0U};
static unsigned int ng32[] = {6U, 0U};
static unsigned int ng33[] = {5U, 0U};
static unsigned int ng34[] = {4U, 0U};
static unsigned int ng35[] = {3U, 0U};
static unsigned int ng36[] = {31U, 1U};
static unsigned int ng37[] = {30U, 1U};
static unsigned int ng38[] = {29U, 1U};
static unsigned int ng39[] = {28U, 1U};
static unsigned int ng40[] = {27U, 1U};
static unsigned int ng41[] = {26U, 1U};
static unsigned int ng42[] = {25U, 1U};
static unsigned int ng43[] = {24U, 1U};
static unsigned int ng44[] = {23U, 1U};
static unsigned int ng45[] = {22U, 1U};
static unsigned int ng46[] = {21U, 1U};
static unsigned int ng47[] = {20U, 1U};
static unsigned int ng48[] = {19U, 1U};
static unsigned int ng49[] = {18U, 1U};
static unsigned int ng50[] = {17U, 1U};
static unsigned int ng51[] = {16U, 1U};
static unsigned int ng52[] = {15U, 1U};
static unsigned int ng53[] = {14U, 1U};
static unsigned int ng54[] = {13U, 1U};
static unsigned int ng55[] = {12U, 1U};
static unsigned int ng56[] = {11U, 1U};
static unsigned int ng57[] = {10U, 1U};
static unsigned int ng58[] = {9U, 1U};
static unsigned int ng59[] = {8U, 1U};
static unsigned int ng60[] = {7U, 1U};
static unsigned int ng61[] = {6U, 1U};
static unsigned int ng62[] = {5U, 1U};
static unsigned int ng63[] = {4U, 1U};
static unsigned int ng64[] = {3U, 1U};
static unsigned int ng65[] = {31U, 0U, 2U};
static unsigned int ng66[] = {30U, 0U, 2U};
static unsigned int ng67[] = {29U, 0U, 2U};
static unsigned int ng68[] = {28U, 0U, 2U};
static unsigned int ng69[] = {27U, 0U, 2U};
static unsigned int ng70[] = {26U, 0U, 2U};
static unsigned int ng71[] = {25U, 0U, 2U};
static unsigned int ng72[] = {24U, 0U, 2U};
static unsigned int ng73[] = {23U, 0U, 2U};
static unsigned int ng74[] = {22U, 0U, 2U};
static unsigned int ng75[] = {21U, 0U, 2U};
static unsigned int ng76[] = {20U, 0U, 2U};
static unsigned int ng77[] = {19U,