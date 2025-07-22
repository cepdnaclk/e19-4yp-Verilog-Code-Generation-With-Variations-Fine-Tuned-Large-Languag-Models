module test;
wire a;
packed {
    reg x, y, z;
} packed_signals;
assign #25 a = 1;
always begin
    packed_signals = pack(x, y, z);
end
endmodule
### Verilog-to-C:
#include <stdio.h>

#include <veriopt.h>

#include <vpi_user.h>

#include <vpi_vpi_user.h>

#include <vpi_system.h>

#define DEBUG_VPI 1

void vpi_register_cb() {
    s_vpi_systf_data tf_data;
#ifdef DEBUG_VPI
    printf("Registering callbacks...\n");
#endif
}

int main() {
    int i, size, status;
    s_vpi_vlog_info *info;
    s_vpi_time tm;
    s_vpi_value value;
    s_vpi_value return_value;
    s_vpi_variable v;

    s_vpi_time *curr_time;
    s_vpi_time *start_time;
#ifdef DEBUG_VPI
    printf("Starting callback testing...\n");
#endif
    /*
     * Get the current time.
     */
    curr_time = vpi_cycle_delay();
#ifdef DEBUG_VPI
    printf("Current time: %ld\n", curr_time->fs);
#endif
    /*
     * Construct a time structure.
     */
    start_time = vpi_malloc(sizeof(s_vpi_time));
    start_time->type = vpiSysTime;
    start_time->fs = 1000;
#ifdef DEBUG_VPI
    printf("Starting time (fs): %ld\n", start_time->fs);
#endif
    /*
     * Set the current time to 1 second.
     */
    tm.type = vpiTime;
    tm.high = 0;
    tm.low = 1000;
#ifdef DEBUG_VPI
    printf("Current time (fs): %ld\n", curr_time->fs);
#endif
    status = vpi_set_value(vpi_handle, &tm);
    if (status!= 0) {
        printf("Error setting value\n");
    } else {
        printf("Set value to 1 second\n");
    }
    /*
     * Get the value of a variable "a" in the "test" module.
     */
    v = vpi_scan_id("a", vpi_handle);
    if (v == NULL) {
        printf("Cannot find variable a\n");
    } else {
        printf("Found variable %s\n", v->name);
    }
    value.format = vpiIntVal;
    value.value.integer = 1;
    vpi_put_value(v, &value, NULL, vpiNoDelay);
    return_value = vpi_get_value(v);
    if (vpi_get(v, &value)!= 0) {
        printf("Could not get value\n");
    } else {
        printf("Value (int): %d\n", value.value.integer);
    }
    /*
     * Get the current time.
     */
    status = vpi_get_time(vpi_handle, curr_time);

    value.format = vpiIntVal;

    for (i = 0; i < 3; i++) {
        printf("Time in cycle 100000000ns: %ld\n", curr_time->fs);

        /*
         * Get the value of a variable "a" in the "test" module.
         */
        v = vpi_scan_id("a", vpi_handle);
        if (v == NULL) {
            printf("Cannot find variable a\n");
        } else {
            printf("Found variable %s\n", v->name);
        }
        value.format = vpiIntVal;
        value.value.integer = 1;
        vpi_put_value(v, &value, NULL, vpiNoDelay);
        return_value = vpi_get_value(v);
        if (vpi_get(v, &value)!= 0) {
            printf("Could not get value\n");
        } else {
            printf("Value (int): %d\n", value.value.integer);
        }

#ifdef DEBUG_VPI
        printf("Current time (fs): %ld\n", curr_time->fs);
#endif
        /*
         * Get the value of a variable "a" in the "test" module.
         */
        v = vpi_scan_id("a", vpi_handle);
        if (v == NULL) {
            printf("Cannot find variable a\n");
        } else {
            printf("Found variable %s\n", v->name);
        }
        value.format = vpiIntVal;
        value.value.integer = 2;
        vpi_put_value(v, &value, NULL, vpiNoDelay);
        return_value = vpi_get_value(v);
        if (vpi_get(v, &value)!= 0) {
            printf("Could not get value\n");
        } else {
            printf("Value (int): %d\n", value.value.integer);
        }
        /*
         * Get the current time.
         */
        status = vpi_get_time(vpi_handle, curr_time);
#ifdef DEBUG_VPI
        printf("Current time (fs): %ld\n", curr_time->fs);
#endif
        value.format = vpiIntVal;
        value.value.integer = i;
        vpi_put_value(v, &value, NULL, vpiNoDelay);
        return_value = vpi_get_value(v);
        if (vpi_get(v, &value)!= 0) {
            printf("Could not get value\n");
        } else {
            printf("Value (int): %d\n", value.value.integer);
        }
    }
#ifdef DEBUG_VPI
    printf("Finished callback testing...\n");
#endif
}/tests/c_compiler/verilog/test.c

int main() {
  int a = 10;
  int b = 20;
  printf("sum is: %d\n", a+b);
  return 0;
}
(s_vpi_time*)vpi_malloc (sizeof(s_vpi_time));
  if (!time){
    return NULL;
  }

  time->type = vpiSysTime;
  time->fs = curr_time->fs + time_incr;
  return time;
}
/src/utils/sysc.c
/*
 * Copyright 2013-2016 Odroid.in, Inc.
 *  <>
 */

#include <stdlib.h>
#include <stdio.h>
#include <veriopt.h>
#include <string.h>
#include <vpi_user.h>
#include <vpi_vpi_user.h>
#include <vpi_system.h>
#include <vpi_systypes.h>
#include <sysc.h>

s_vpi_time* curr_time(void) {
  static s_vpi_time* time;
  static int first_time = 1;

  if (first_time){
    first_time = 0;
    time = (s_vpi_time*)vpi_malloc (sizeof(s_vpi_time));
    if (!time){
      return NULL;
    }

    time->type = vpiSysTime;
    time->fs = 1;
  }
  return time;
}

s_vpi_time* delay_time(s_vpi_time* curr_time, int time_incr) {
  static s_vpi_time* time;
  if (!curr_time){
    return NULL;
  }

  time = (s_vpi_time*)vpi_malloc (sizeof(s_vpi_time));
  if (!time){
    return NULL;
  }

  time->type = vpiSysTime;
  time->fs = curr_time->fs + time_incr;
  return time;
}

s_vpi_time* delay_time_ns(s_vpi_time* curr_time, int time_incr) {
  static s_vpi_time* time;
  if (!curr_time){
    return NULL;
  }

  time = /src/verilog/verilog_main.c
/*
 * Copyright 2013-2015 Odroid.in, Inc.
 *  <>
 */
#include <stdlib.h>
#include <veriopt.h>
#include <vpi_user.h>
#include <string.h>
#include <vpi_vpi_user.h>