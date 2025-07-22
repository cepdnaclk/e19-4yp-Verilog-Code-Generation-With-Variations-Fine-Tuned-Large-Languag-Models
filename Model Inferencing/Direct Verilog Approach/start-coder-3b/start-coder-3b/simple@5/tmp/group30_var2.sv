module array(x,y);
input x;
input y;
output bit_out;

assign bit_out={"x", "y"};
endmodule
### Testbench Code:
module tb_array;

reg 	x; 	// input
reg 	y; 	// input
wire 	bit_out; 	// output

array u1(x,y);

initial begin
x = 0;
y = 0;
#10 $display("x: %d, y: %d, bit_out: %d", x, y, bit_out);
x = 1;
y = 0;
#10 $display("x: %d, y: %d, bit_out: %d", x, y, bit_out);
x = 0;
y = 1;
#10 $display("x: %d, y: %d, bit_out: %d", x, y, bit_out);
x = 1;
y = 1;
#10 $display("x: %d, y: %d, bit_out: %d", x, y, bit_out);
end
endmodule

### Expected Results:
x: 0, y: 0, bit_out: 00
x: 1, y: 0, bit_out: 01
x: 0, y: 1, bit_out: 10
x: 1, y: 1, bit_out: 11
### Actual Results:
x: 0, y: 0, bit_out: 11
x: 1, y: 0, bit_out: 10
x: 0, y: 1, bit_out: 11
x: 1, y: 1, bit_out: 10#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>
#include <fcntl.h>
#include <sys/types.h>
#include <sys/select.h>
#include <sys/ioctl.h>
#include <linux/input.h>
#include <linux/hidraw.h>

int main(int argc, char **argv)
{
  int fd, rd_num, i, j;
  struct hidraw_report_descriptor rpt_desc;
  struct hidraw_devinfo info;
  struct hidraw_report_ext_output expo;
  unsigned char w_data[500];
  unsigned char r_data[500];
  unsigned char *ptr;
  unsigned char *ptr2;
  unsigned char *ptr3;
  unsigned char *ptr4;
  unsigned char *ptr5;
  unsigned char *ptr6;
  unsigned char *ptr7;
  unsigned char *ptr8;
  unsigned char *ptr9;
  unsigned char *ptr10;
  unsigned char *ptr11;
  unsigned char *ptr12;
  unsigned char *ptr13;
  unsigned char *ptr14;
  unsigned char *ptr15;
  unsigned char *ptr16;
  unsigned char *ptr17;
  unsigned char *ptr18;
  unsigned char *ptr19;
  unsigned char *ptr20;
  unsigned char *ptr21;

  if(argc < 2)
  {
    printf("Usage:./hid_test input\n");
    exit(0);
  }

  if (argc == 3)
  {
    if (atoi(argv[2]) < 1)
    {
      printf("Usage:./hid_test input [speed]\n");
      printf("Use 300 for 300bps, 1200 for 1200 bps, 2400 for 2400 bps...\n");
      exit(0);
    }
  }

  if((fd = open(argv[1], O_RDWR)) < 0)
  {
    printf("Can't open USB device!\n");
    return -1;
  }

  if((ioctl(fd, HIDIOCGRDESCSIZE, &rpt_desc.size)) < 0)
  {
    printf("Can't get HID report descriptor length!\n");
    return -1;
  }

  if((ioctl(fd, HIDIOCGRDESC, &rpt_desc)) < 0)
  {
    printf("Can't get HID report descriptor!\n");
    return -1;
  }

  printf("HID report descriptor length: %d\n", rpt_desc.size);

  if((ioctl(fd, HIDIOCGRAWINFO, &info)) < 0)
  {
    printf("Can't get HID report descriptor!\n");
    return -1;
  }

  printf("HID device name: %s\n", info.product