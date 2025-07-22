module t_Clock_Prog ();
wire clock;

initial #100 $finish;
Clock_Prog M1 (clk);
endmodule
### Expected Behavior:
Pass
### Actual Behavior:
Fail

<sub>Submitted by   via Issue #536</sub>
/tests/positive_tests/t_clk_to_out_test/t_clk_to_out.c
//*****************************************************************************************************************
// Project: SURELOG
//
// File: t_clk_to_out.c
//
// Description:
// A test case for clock to output
//
//*****************************************************************************************************************

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include <vpi_user.h>

#include "common.h"
#include "vlog_utils.h"

int main()
{
  s_vpi_vlog_info info;
  info.user_data = NULL;
  info.vlog_info_cb = NULL;

  s_vpi_vlog_info_level_e level;
  level.cb_prefix = "t_clk_to_out";
  level.max_level = VLOG_MAX_LEVEL;

  set_vlog_info(&info, &level);

  s_vpi_time time_stamp;
  s_vpi_value value;
  int32 value_int;

  p_vpi_time p_time_stamp;
  p_vpi_value p_value;

  const char *tb_str = "t_clk_to_out";
  vpiHandle top_module, tb_handle, clk_handle, out_handle, clk_to_out_handle, clk_to_out_0_handle, clk_to_out_1_handle;

  if (argc < 2) {
    printf("Usage: t_clk_to_out <design_file>\n");
    return -1;
  }
  if (load_design(argv[1], tb_str, &top_module)!= 0) {
    return -1;
  }
  if (vpi_handle_resolve(&tb_handle, tb_str, vpiSysTfSimHandle)!= -1) {
    vpi_get_time(get_vlog_time(&time_stamp, VPI_SIMEVT), p_time_stamp);
    printf("%s:tb: %s (%d)\n", get_vlog_time_str(p_time_stamp), vpi_get_value_str(p_time_stamp, vpiStringVal), vpi_get(p_time_stamp, vpiTime, vpiSimTimeVal));
  }

  if (vpi_handle_resolve(&clk_handle, "clock", NULL)!= -1)
    vpiHandleToHObj(clk_handle, (p_vpiHandle) &clk_handle);

  if (vpi_handle_resolve(&out_handle, "out", NULL)!= -1)
    vpiHandleToHObj(out_handle, (p_vpiHandle) &out_handle);

  if (vpi_handle_resolve(&clk_to_out_handle, "clk_to_out", NULL)!= -1)
    vpiHandleToHObj(clk_to_out_handle, (p_vpiHandle) &clk_to_out_handle);

  if (vpi_handle_resolve(&clk_to_out_0_handle, "clk_to_out", 0)!= -1)
    vpiHandleToHObj(clk_to_out_0_handle, (p_vpiHandle) &clk_to_out_0_handle);

  if (vpi_handle_resolve(&clk_to_out_1_handle, "clk_to_out", 1)!= -1)
    vpiHandleToHObj(clk_to_out_1_handle, (p_vpiHandle) &clk_to_out_1_handle);

  if (vpi_handle_resolve(&clk_to_out_handle, "clk_to_out", NULL)!= -1)
    vpiHandleToHObj(clk_to_out_handle, (p_vpiHandle) &clk_to_out_handle);

  if (vpi_handle_resolve(&clk_to_out_0_handle, "clk_to_out", 0)!= -1)
    vpiHandleToHObj(clk_to_out_0_handle, (p_vpiHandle) &clk_to_out_0_handle);

  if (vpi_handle_resolve(&clk_to_out_1_handle, "clk_to_out", 1)!= -1)
    vpiHandleToHObj(clk_to_out_1_handle, (p_vpiHandle) &clk_to_out_1_handle);

  if (clk_handle) {
    if (vpi_get_value(clk_handle, &value)!= 0) {
      printf("Error in getting value of clk\n");
      return -1;
    } else {
      value_int = value.value.integer;
      printf("clk = (time %d, value %d)\n", vpi_get(clk_handle, vpiSimTimeVal), value_int);
    }
  }

  if (out_handle) {
    if (vpi_get_value(out_handle, &value)!= 0) {
      printf("Error in getting value of out\n");
      return -1;
    } else {
      value_int = value.value.integer;
      printf("out = (time %d, value %d)\n", vpi_get(out_handle, vpiSimTimeVal), value_int);
    }
  }

  if (clk_to_out_handle) {
    if (vpi_get_value(clk_to_out_handle, &value)!= 0) {
      printf("Error in getting value of clk_to_out\n");
      return -1;
    } else {
      value_int = value.value.integer;
      printf("clk_to_out = (time %d, value %d)\n", vpi_get(clk_to_out_handle, vpiSimTimeVal), value_int);
    }
  }

  if (clk_to_out_0_handle) {
    if (vpi_get_value(clk_to_out_0_handle, &value)!= 0) {
      printf("Error in getting value of clk_to_out_0\n");
      return -1(out_handle, &value)!= 0) {
      printf("Error in getting value of out\n");
      return -1;
    } else {
      value_int = value.value.integer;
      printf("out = (time %d, value %d)\n", vpi_get(out_handle, vpiSimTimeVal), value_int);
    }
  }

  if (clk_to_out_handle) {
    if (vpi_get_value(clk_to_out_handle, &value)!= 0) {
      printf("Error in getting value of clk_to_out\n");
      return -1;
    } else {
      value_int = value.value.integer;
      printf("clk_to_out = (time %d, value %d)\n", vpi_get(clk_to_out_handle, vpiSimTimeVal), value_int);
    }
  }

  if (clk_to_out_0_handle) {
    if (vpi_get_value(clk_to_out_0_handle, &value)!= 0) {
      printf("Error in getting value of clk_to_out_0\n");
      return -1;
    } else {
      value_int = value.value.integer;
      printf("clk_to_out_0 = (time %d, value %d)\n", vpi_get(clk_to_out_0_handle, vpiSimTimeVal), value_int);
    }
  }

  if (clk_to_out_1_handle) {
    if (vpi_get_value(clk_to_out_1_handle, &value)!= 0) {
      printf("Error in getting value of clk_to_out_1\n");
      return -1;
    } else {
      value_int = value.value.integer;
      printf("clk_to_out_1 = (time %d, value %d)\n", vpi_get(clk_to_out_1_handle, vpiSimTimeVal), value_int);
    }
  }

  return 0;
}
;
    } else {
      value_int = value.value.integer;
      printf("clk_to_out_0 = (time %d, value %d)\n", vpi_get(clk_to_out_0_handle, vpiSimTimeVal), value_int);
    }
  }

  if (clk_to_out_1_handle) {
    if (v