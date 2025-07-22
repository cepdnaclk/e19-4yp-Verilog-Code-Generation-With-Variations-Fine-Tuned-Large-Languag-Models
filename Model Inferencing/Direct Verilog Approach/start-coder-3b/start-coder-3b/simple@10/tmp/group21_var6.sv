module example3_1 (x1, x2, x3, x4, f, g, h);
input x1, x2, x3, x4;
output f, g, h;
struct {
rand : 1;
} s;
assign g = (x1 & x3) | (x2 & x4);
assign h = (x1 | x3) & (x2 | x4);
always_ff @(posedge clk or negedge rst_n) begin
if (rst_n == 1'b1) begin
f <= 1'b0;
g <= 1'b0;
h <= 1'b0;
end else begin
f <= g | h;
end
end endmodule

module example3_2 (x1, x2, x3, x4, f, g, h);
input x1, x2, x3, x4;
output f, g, h;
struct {
rand : 1;
} s;
assign g = (x1 | x3) & (x2 | x4);
assign h = (x1 | x3) & (x2 | x4);
always_ff @(posedge clk or negedge rst_n) begin
if (rst_n == 1'b1) begin
f <= 1'b0;
g <= 1'b0;
h <= 1'b0;
end else begin
f <= g | h;
end
end endmodule
### Output:
test_result = FAIL
### Expected Output:
test_result = PASS
/test/benchmarks/vpp/src/vpp_tests_6/src/vpp_tests_6.c
///
/// @file vpp_tests_6.c
///
/// @copyright All code copyright Movidius Ltd 2012, all rights reserved
///            For License Warranty see: common/license.txt
///
/// @defgroup
/// @{
/// @brief    VPP Tests
/// @details  VPP test suite
/// @{
/// @brief    Tests : CMXVPP_6
/// @details
/// @{

#ifdef __XC__
#include <stdio.h>
#include <stdlib.h>
#endif

#include <string.h>

/* Unit Test includes */
#include "Test.h"
#include "v