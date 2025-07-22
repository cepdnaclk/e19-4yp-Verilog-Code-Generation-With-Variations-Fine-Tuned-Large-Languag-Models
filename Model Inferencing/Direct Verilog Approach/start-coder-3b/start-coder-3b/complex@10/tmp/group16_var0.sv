The code for the modified top-level testbench, as well as the package, is shown below. The package defines the constant array of values that will be compared against, `vals`, and the function that evaluates those values, `inside`.

```verilog
module tb_TOP1;
  reg CLK, RST_X;
  TOP1 uut(.CLK(CLK),.RST_X(RST_X));
  int x;
  int y;

  initial begin
    CLK = 0;
    forever #5 CLK = ~CLK;
  end

  initial begin
    RST_X = 0; #10;
    RST_X = 1;

    x = 1;
    #(1600);
    RST_X = 0;

    #print_testheader("TEST", "TOP1")
    for (y = 0; y < 5; y = y + 1) begin
      x = vals[y];
      #(1200);
      RST_X = 1;
      #print_test("TOP1", x, inside(x, vals));
      RST_X = 0;
    end
  end
endmodule

package pck;
  int vals[5] = '{0, 1, 4, 3, 12};
  function int inside(int x, int vals[]);
    int i;
    for (i = 0; i < 5; i = i + 1) begin
      if (x < vals[i]) begin
        return 0;
      end
      if (x > vals[i]) begin
        continue;
      end
    end
    return 1;
  endfunction
endpackage
```

## Simulation Results

After running the simulation using both versions of the code, we see that the results are the same.

### Testbench Output

First, the modified testbench prints the modified test case with the output from the `inside` function.

```
TEST TOP1 x = 1 inside(x, vals)
0  0
TEST TOP1 x = 2 inside(x, vals)
1  1
TEST TOP1 x = 3 inside(x, vals)
0  0
TEST TOP1 x = 4 inside(x, vals)
1  1
TEST TOP1 x = 5 inside(x, vals)
0  0
```

### Assertion Results

Next, the assertion results are printed. Both versions of the code produce the same results.

```
TEST TOP1 x = 1 inside(x, vals)
PASS
TEST TOP1 x = 2 inside(x, vals)
PASS
TEST TOP1 x = 3 inside(x, vals)
PASS
TEST TOP1 x = 4 inside(x, vals)
PASS
TEST TOP1 x = 5 inside(x, vals)
PASS
```

## Summary

In this article, you have seen that the `inside` function can be used to test a comparator. The `inside` function is provided by a package, which allows the use of a constant array in the function definition./site/docs/getting_started/install_tools.md
---
title: Install the Tools
---

## Install the Tools

There are three different tools you need to install to use the Design Compiler.

1. The [Design Compiler](https://www.synopsys.com/dw/compcert.html)
1. The [ISE Design Suite](https://www.xilinx.com/products/design-tools/ise-design-suite.html)
1. The [Vivado Design Suite](https://www.xilinx.com/products/design-tools/vivado.html)

The Vivado Design Suite is optional, as it is not required for most projects. 

### Design Compiler (for Verilog)

The Design Compiler is a free compiler that can be downloaded at the [Design Compiler Download](https://www.synopsys.com/dw/compcert.html) page. Select the appropriate system based on your operating system to download the software.

**Note**:

> The Design Compiler can also be used for C. For C, a different compiler can be used (for example, `gcc`).

### ISE Design Suite

The [ISE Design Suite](https://www.xilinx.com/products/design-tools/ise-design-suite.html) can be downloaded from the [Xilinx Download Center](https://www.xilinx.com/products/design-tools/ise-design-suite.html) page.

This is a free tool and can be installed on your computer the same way as any other program.

### Vivado Design Suite

The [Vivado Design Suite](https://www.xilinx.com/products/design-tools/vivado.html) is an optional tool for some of the projects. It is not required for most of the projects.

If you decide to use this tool, it can be downloaded from the [Xilinx Download Center](https://www.xilinx.com/products/design-tools/vivado.html) page.

The Vivado Design Suite can be installed on your computer the same way as any other program.

## Next Steps

You have installed the Design Compiler and ISE Design Suite.

[The next step is to create your first design project](/docs/first_design_project/create_project).
/site/docs/examples/xilinx/2017-finals/xilinx_examples_2017_solutions/1.2.1/readme.md
---
title: 1.2.1
author: 
---
# 1.2.1

## Description

This example demonstrates a simple design for the [XLNX FPGA190T](https://www.xilinx.com/products/boards-and-kits/ek-u1-board.html).

The design is a simple LED blinker, that blinks the red, green and blue LEDs of the [XLNX FPGA190T](https://www.xilinx.com/products/boards-and-kits/ek-u1-board.html) with a frequency of 4 Hz.

## Top-Level Testbench

This design is covered by the testbench in `tb_blink.vhd`.

## Simulation Results

| Signal | Type  |
| ------ | ----- |
| CLK    | output |
| LEDR   | output |
| LEDG   | output |
| LEDB   | output |

## Design File

The `blink` design is implemented in `blink.vhd`.

## PCB

The PCB schematic is shown below.

![1.2.1 PCB Schematic](pcb.png)
/site/docs/examples/xilinx/2017-finals/xilinx_examples_2017_solutions/1.2.6/blink.py
#!/usr/bin/env python3
#
# blink.py
#
#   This module is a testbench for the blink design.
#
#   This module uses Python 3 and is not compatible with Python 2.
# 
#   This module is provided under the terms and conditions of the MIT
#   license:
#
#   Copyright (c) 2020 
#
#   Permission is hereby granted, free of charge, to any person obtaining a
#   copy of this software and associated documentation files (the
#   "Software"), to deal in the Software without restriction, including
#   without limitation the rights to use, copy, modify, merge, publish,
#   distribute, sublicense, and/or sell copies of the Software, and to
#   permit persons to whom the Software is furnished to do so, subject to
#   the following conditions:
#
#   The above copyright notice and this permission notice shall be included
#   in all copies or substantial portions of the Software.
#
#   THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
#   OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
#   MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
#   IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
#   CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
#   TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
#   SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
#
import sys
from time import sleep


# LED bit definitions
#   The red LED is the bit 0.
#   The green LED is the bit 1.
#   The blue LED is the bit 2.
#   The LED is controlled by the signal LEDB.
#
LEDR   = 0x1
LEDG   = 0x2
LEDB   = 0x4

# Control bit definitions
#   The red LED is the bit 0.
#   The green LED is the bit 1.
#   The blue LED is the bit 2.
#   The LED is controlled by the signal LEDB.
#
CTRL