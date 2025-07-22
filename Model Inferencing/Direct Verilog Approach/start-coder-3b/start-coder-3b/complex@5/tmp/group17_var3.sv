module adder
(input wire [7:0] a,
input wire [7:0] b,
output reg [8:0] sum, // The 8-bit sum
output reg carry // Carry or overflow
);
assign sum = a + b;
assign carry = sum[7];
endmodule

### Performance Improvement:
-   Performance of the basic code is similar
-   Performance of the `inside` code is faster
/*
 * Simple timer example
 * This example shows how to use timers to count
 * seconds, minutes, hours, days, weeks, months, and years.
 * The timer is a 32-bit counter initialized at 0x10000000
 * and decremented to 0x00000000 every 1 millisecond.
 * It can be set to decrement in any of the following units:
 * - Seconds
 * - Minutes
 * - Hours
 * - Days
 * - Weeks
 * - Months
 * - Years
 * This value is captured in two counter registers:
 *
 * Second Counter:
 *   Timer[0-9]   = 0x000003E8 = 1,000,000 microseconds
 *   Timer[10-19] = 0x00000000 = 0
 *   Timer[20-29] = 0x00000000 = 0
 *   Timer[30-31] = 0x00000000 = 0
 *
 * Minute Counter:
 *   Timer[0-9]   = 0x000001F4 = 1,000,000 microseconds
 *   Timer[10-19] = 0x00000000 = 0
 *   Timer[20-29] = 0x00000000 = 0
 *   Timer[30-31] = 0x00000000 = 0
 *
 * Hour Counter:
 *   Timer[0-9]   = 0x00000002 = 1,000,000 microseconds
 *   Timer[10-19] = 0x00000000 = 0
 *   Timer[20-29] = 0x00000000 = 0
 *   Timer[30-31] = 0x00000000 = 0
 *
 * Day Counter:
 *   Timer[0-9]   = 0x00000001 = 1,000,000 microseconds
 *   Timer[10-19] = 0x00000000 = 0
 *   Timer[20-29] = 0x00000000 = 0
 *   Timer[30-31] = 0x00000000 = 0
 *
 * Week Counter:
 *   Timer[0-9]   = 0x00000001 = 1,000,000 microseconds
 *   Timer[10-19] = 0x00000000 = 0
 *   Timer[20-29] = 0x00000000 = 0
 *   Timer[30-31] = 0x00000000 = 0
 *
 * Month Counter:
 *   Timer[0-9]   = 0x00000001 = 1,000,000 microseconds
 *   Timer[10-19] = 0x00000000 = 0
 *   Timer[20-29] = 0x00000000 = 0
 *   Timer[30-31] = 0x00000000 = 0
 *
 * Year Counter:
 *   Timer[0-9]   = 0x00000001 = 1,000,000 microseconds
 *   Timer[10-19] = 0x00000000 = 0
 *   Timer[20-29] = 0x00000000 = 0
 *   Timer[30-31] = 0x00000000 = 0
 *
 * All counters are cleared once the timer reaches 0x00000000.
 * This will be useful to implement the timer reset function.
 *
 *
 * The following code is run infinitely.
 *
 * Author: 
 * Date: 12/