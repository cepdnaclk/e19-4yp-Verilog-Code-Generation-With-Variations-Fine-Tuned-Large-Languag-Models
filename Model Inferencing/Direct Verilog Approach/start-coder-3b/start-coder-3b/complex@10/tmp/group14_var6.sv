module hex7seg_le (
input wire [3:0] x,
output wire [6:0] a_to_g // Outputs for segments a,b,c,d,e,f,g
);
// Logic equations for each segment (active high assumed)
generate
for (i = 0; i < 7; i = i+1) begin
assign a_to_g[i] = ~x[3] & ~x[2] & ~x[1] & x[0] // a (segment index 6)
| ~x[3] & x[2] & ~x[1] & ~x[0]
| x[3] & x[2] & ~x[1] & x[0]
| x[3] & ~x[2] & x[1] & x[0]
| (i == 6)? x[3] : 0;
end
endgenerate
endmodule
### Variation Instruction:
Split the code into three verilog files. The first is the source file for your top level module, here called ‘hex7seg_le.v’. The second file is the sub module that drives the LED segments, called ‘hex7seg_le_led_segs.v’. The third file is the ‘hex7seg_le_testbench.v’ file that will test the hex7seg_le module.
### Sub Modules - Source File:
module hex7seg_le_led_segs (
input wire [3:0] x,
output wire [6:0] a_to_g // Outputs for segments a,b,c,d,e,f,g
);
// Logic equations for each segment (active high assumed)
assign a_to_g[6] = ~x[3] & ~x[2] & ~x[1] & x[0] // a (segment index 6)
| ~x[3] & x[2] & ~x[1] & ~x[0]
| x[3] & x[2] & ~x[1] & x[0]
| x[3] & ~x[2] & x[1] & x[0];
assign a_to_g[5] = x[2] & x[1] & ~x[0] // b (segment index 5)
| x[3] & x[1] & x[0]
| ~x[3] & x[2] & ~x[1] & x[0]
| x[3] & x[2] & ~x[1] & ~x[0];
assign a_to_g[4] = ~x[3] & ~x[2] & x[1] & ~x[0] // c (segment index 4)
| x[3] & x[2] & x[1]
| x[3] & x[2] & ~x[0];
assign a_to_g[3] = ~x[3] & ~x[2] & ~x[1] & x[0] // d (segment index 3)
| ~x[3] & x[2] & ~x[1] & ~x[0]
| x[3] & ~x[2] & x[1] & ~x[0]
| x[2] & x[1] & x[0];
assign a_to_g[2] = ~x[3] & x[0] // e (segment index 2)
| ~x[3] & x[2] & ~x[1]
| ~x[2] & ~x[1] & x[0];
assign a_to_g[1] = ~x[3] & ~x[2] & x[0] // f (segment index 1)
| ~x[3] & ~x[2] & x[1]
| ~x[3] & x[1] & x[0]
| x[3] & x[2] & ~x[1] & x[0];
assign a_to_g[0] = ~x[3] & ~x[2] & ~x[1] // g (segment index 0)
| x[3] & x[2] & ~x[1] & ~x[0]
| ~x[3] & x[2] & x[1] & x[0];
endmodule
### Testbench File:

```
`timescale 1 ns / 1 ps
module hex7seg_le_tb #(
parameter int NUM_BITS = 4
) (
input wire clk,
input wire rst_n,
input wire [3:0] x,
output wire [NUM_BITS+6:0] a_to_g
);
reg [3:0] x;
wire [NUM_BITS:0] hex;
hex7seg_le hex7seg (
.x(x),
.a_to_g(a_to_g)
);
assign hex[NUM_BITS] = 1'b1;
always @(posedge clk) begin
if (rst_n) x = 4'b0000;
else x <= x + 1'b1;
end
endmodule
```
### Top Level Source File:

```module hex7seg_le #(
parameter int NUM_BITS = 4
) (
input wire clk,
input wire rst_n,
input wire [3:0] x,
output wire [NUM_BITS+6:0] a_to_g
);
wire [NUM_BITS+6:0] a_to_g_from_sub_module;
hex7seg_le_led_segs hex7seg_le_led_segs (
.x(x),
.a_to_g(a_to_g_from_sub_module)
);
assign a_to_g = a_to_g_from_sub_module;
endmodule
```
### Main File:
#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/mman.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>

#define GPIO_BASE 0x20200000
#define GPIO_INPUT(g) (g * 4U)
#define GPIO_OUTPUT(g) (g * 4U + 1U)
#define GPIO_SETDATAOUT_OFFSET 0x1c
#define GPIO_SETDATAIN_OFFSET 0x18

typedef struct {
uint32_t gpfsel[6U];
uint32_t reserved1;
uint32_t gpfset[2U];
uint32_t gpclrl[2U];
uint32_t gpclear[2U];
uint32_t gpset[2U];
uint32_t reserved2[2U];
uint32_t gpdir[2U];
uint32_t reserved3;
uint32_t gppud;
uint32_t reserved4;
uint32_t gppudclk[2U];
uint32_t reserved5[2U];
} gpio_t;

void set_gpio_direction(gpio_t *gpio, uint8_t gpio_num, uint8_t direction) {
if (direction == 1) {
gpio->gpfsel[gpio_num / 10U] =
gpio->gpfsel[gpio_num / 10U] | (3U << ((gpio_num % 10U) * 3U));
}
else {
gpio->gpfsel[gpio_num / 10U] =
gpio->gpfsel[gpio_num / 10U] & ~(7U << ((gpio_num % 10U) * 3U));
}
}

void set_gpio_value(gpio_t *gpio, uint8_t gpio_num, uint8_t value) {
if (value == 1) {
*(gpio->gpset + (gpio_num / 32U)) = 1U << (gpio_num % 32U);
}
else {
*(gpio->gpclr + (gpio_num / 32U)) = 1U << (gpio_num % 32U);
}
}

volatile gpio_t *gpio;

int main(int argc, char *argv[]) {
uint8_t array[4];
int fd, i, j;
uint8_t *ptr, val;

if ((fd = open("/dev/mem", O_RDWR | O_SYNC)) == -1) {
printf("Fail to open /dev/mem\n");
return -1;
}