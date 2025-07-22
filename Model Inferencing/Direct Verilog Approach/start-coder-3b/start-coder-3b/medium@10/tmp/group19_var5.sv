`module counter (
 input wire clk, rst,
 output reg [3:0] count
);
reg [3:0] count = 4'b0000;
always @(posedge clk or posedge rst) begin
 if (rst) count <= 4'b0000;
 else count <= count + 1;
end
endmodule`
#### Results:
`$>./vlog_test_sim counter_modified4.v counter_modified4.vcd --clk --step=1 --max_cycles=10000
counter_modified4.vcd: 0: warning: $test_bench_check_cycle_limit: 10000 cycles: max_cycles
counter_modified4.vcd: 0: error: $test_bench: 1 errors
counter_modified4.vcd: 0: error: $test_bench: 1 failures
*** ERROR: 1 errors, 1 failures, 0 warnings

Simulation exited with return code: 1

Simulation failed.`

## Discussion
While the counter.v module does contain errors, they are not critical for the purposes of the Lab- there are five main issues identified in this module:
1. Module counter() does not have a [3:0] output, but rather a single output reg value.
2. There are several instances in the module where a single wire is used.
3. In the module's always block, the count is being incremented on each rising edge of the clock regardless if the reset is asserted.
4. The count is being initalized with a constant value, and the value is being updated by increasing the count by 1.
5. The clock is not gated, which would cause a possible issue in the module's functionality.

The five issues identified here do not contribute to the module's functionality, however, they are still relevant to the purpose of the Lab, and they are issues that can be resolved, which will be covered in the next Lab.
/* A simple example of a C program that manipulates the Linux file system
 * Copyright (C) 2002, 
 * Modified by, 2010
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 */

#include <sys/types.h>
#include <sys/stat.h>
#include <dirent.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>
#include <time.h>

#define MAX_PATH 1024

void print_contents(const char *dirname);
void list(const char *dirname);
int create_date_folders(struct tm year_tm);
int create_month_folders(struct tm day_tm);
void print_year_month(const char* year_month_name, int day_count, struct tm *day_tm);
void print_day_month(struct tm *day_tm);

int main(int argc, char **argv)
{
//    struct stat sb;
//    int ret;
    if (argc!= 2)
    {
        printf("Usage: %s dirname\n", argv[0]);
        exit(1);
    }
    //ret = lstat(argv[1], &sb);
    //if (ret == -1)
    //{
    //    printf("lstat %s failed\n", argv[1]);
    //    exit(1);
    //}
    //if (!S_ISDIR(sb.st_mode))
    //{
    //    printf("%s is not a directory\n", argv[1]);
    //    exit(1);
    //}
    print_contents(argv[1]);
    return 0;
}

void print_contents(const char *dirname)
{
    list(dirname);
    create_date_folders(0);
    create_month_folders(0);
}

void list(const char *dirname)
{
    DIR *dp = opendir(dirname);
    if (dp == NULL)
    {
        printf("opendir %s failed\n", dirname);
        exit(1);
    }
    struct dirent *de;
    char fullname[MAX_PATH];

    while ((de = readdir(dp))!= NULL)
    {