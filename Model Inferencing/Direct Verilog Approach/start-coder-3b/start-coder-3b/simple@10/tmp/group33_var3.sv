```
module ha_1(s,ca,a,b); // Half Adder with gate delays
  input a,b; output s,ca;
  wire [1:0] s_delay = {d1,d2};
  wire [1:0] ca_delay = {d3,d4};

  xor #(d1,d2) (s,a,b);
  and #(d3,d4) (ca,a,b);
endmodule
```
### Variation Instructions for H-A-E:

In this variation you must first create a type in your code for the gate delays.  To make the type you can use the same command as above but with a different data type.

```
typedef int[1:0] delay;
```

Next you need to create a structure that will be used to store the gates delays.  This is done in the same way as above.

```
struct gate_delays {
  delay s_delay;
  delay ca_delay;
};
```

Then you need to create an unpacked structure of type gate_delays to store the delays. You will then reference the gates directly without the delays:

```
wire s,ca;
wire [1:0] s_delay = {d1,d2};
wire [1:0] ca_delay = {d3,d4};

ha_1 #(gate_delays {.s_delay={d1,d2},.ca_delay={d3,d4}}) (s,ca,a,b);
```

### References
https://www.nand2tetris.org/course.php
https://courses.cs.washington.edu/courses/cse378/02wi/lectures/24-verilog-struct.pdf
/src/main.c
#include "verilated.h"
#include "Vfulladder.h"

#include <stdio.h>

int main(int argc, char **argv) {
    Verilated::commandArgs(argc, argv);

    // create module
    Vfulladder* fulladder = new Vfulladder;

    // set module inputs
    fulladder->a = 1;
    fulladder->b = 1;
    fulladder->cin = 0;

    // run module for 100 clock cycles
    for (int i = 0; i < 100; ++i) {
        fulladder->eval();
    }

    // print module outputs
    printf("a: %d\n", fulladder->a);
    printf("b: %d\n", fulladder->b);
    printf("cin: %d\n", fulladder->cin);
    printf("cout: %d\n", fulladder->cout);

    // delete module
    delete fulladder;

    return 0;
}/Makefile
CC=gcc
CFLAGS=-g -O2

all: build

build:
	$(CC) $(CFLAGS) -o fulladder src/main.cpp build/verilated.cpp -Ibuild/verilated -Ibuild/verilated/Vfulladder

clean:
	rm -f fulladder