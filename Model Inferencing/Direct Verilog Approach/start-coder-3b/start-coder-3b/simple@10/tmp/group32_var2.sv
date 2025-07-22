module t_Clock_Prog ();
wire clock;

initial #100 $finish;
Clock_Prog M1 (clk);
endmodule
/test_data/test03_011_case004/expected.c
#include "system.h"

int main(void) {
    enum en {A, B};
    enum en b = B;
    int a;
    switch ((int)b) {
        case A:
            a = 1; break;
        default:
            a = 2; break;
    }
    return a;
}
/test_data/test03_012_case001/expected.c
#include "system.h"

int main(void) {
    char a = 'e', b = 'd';
    if (a == b)
        return 1;
    else
        return 0;
}
/test_data/test02_002_case014/expected.c
#include "system.h"

int main() {
    int a = 0x1000;
    int b = 0x00FF;
    int c = (a >> 8) | (b << 8);
    return c;
}
/hw/lib/test/Makefile
# Copyright (c) 2014 

# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:

# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

MKFILE_PATH := $(abspath $(lastword $(MAKEFILE_LIST)))
MKFILE_DIR := $(dir $(MKFILE_PATH))

TARGETS = $(MKFILE_DIR)../sim/bin/verilator/V$(MKFILE_DIR)../test.o

.PHONY: all

all: $(TARGETS)

$(MKFILE_DIR)../sim/bin/verilator/V$(MKFILE_DIR)../test.o:
	cd $(MKFILE_DIR)../sim/bin/verilator && $(MAKE) -C $(MKFILE_DIR)../../../../rtl/test
/README.md
# Verilog to C Compiler

[![Join the chat at https://gitter.im/mithi/v2cc](https://badges.gitter.im/mithi/v2cc.svg)](https://gitter.im/mithi/v2cc?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

[![Build status](https://travis-ci.org/mithi/v2cc.png)](https://travis-ci.org/mithi/v2cc)

This repository contains the code base for the compiler project of [EECS340](https://courses.missouri.edu/faculty/carr/340.html) at [MIT](https://www.mit.edu). The project is also hosted on [Gitlab](https://gitlab.com/mithi/v2cc).

## Requirements
* [Verilator](http://www.veripool.org/wiki/verilator)
* [Python 2.7+](https://www.python.org)
* [GNU Make](https://www.gnu.org/software/make)
* [Ruby](https://www.ruby-lang.org)

## Usage

```bash
$ make
$ make run
```

## References

* https://github.com/mithi/compilers-class
* https://github.com/wch/llvm-gcc-4.2
* https://github.com/karelzak/util-linux
* https://github.com/sachaos/wllvm
* https://github.com/google/llvh/
* http://www.openbsd.org/openbsd-6.3/src/sys/cdefs/
* https://github.com/kewilson/cmocka
/test_data/test03_010_case003/expected.c
#include "system.h"

int main(void) {
    typedef int my_type;
    my_type a = 2, b = 3;
    return a + b;
}
/test_data/test02_010_case003/expected.c
#include "system.h"

int main(void) {
    int a = 1 * 2 / 3 - 2 % 4;
    return a;
}
/test_data/test03_011_case002/expected.c
#include "system.h"

int main(void) {
    enum en {A, B};
    int a = B;
    a = 1;
    return a;
}
/test_data/test02_005_case004/expected.c
#include "system.h"

int main(void) {
    int a = -76 % 8;
    int b = -76 % -8;
    return a + b;
}
/test_data/test02_003_case008/expected.c
#include "system.h"

int main(void) {
    int a = 3, b = 5, c = 7, d = 11;
    int x = a / b / c / d;
    int y = a * b * c * d;
    return x - y;
}
/test_data/test02_010_case006/expected.c
#include "system.h"

int main(void) {
    int a = 1 + 2 % 3 - 4 - 5 * 6 / 7 % 8 - 9 + 10 * 11;
    return a;
}
/test_data/test02_005_case008/expected.c
#include "system.h"

int main(void) {
    int a = 55 * 100 - 55, b = 55 * 100 * 100 + 55;
    return a + b;
}
/test_data/test02_002_case016/expected.c
#include "system.h"

int main() {
    int a = 0x00FF, b = 0x7F, c = 0x00FF, d = 0xFF00;
    int e = (a << 8) | (b >> 8);
    int f = (c << 8) | (d >> 8);
    return e - f;
}
/test_data/test03_009_case001/expected.c
#include "system.h"

int main(void) {
    int a = 0x00001000;
    int b = 0x10000000;
    int c = a ^ b;
    return c;
}
/test_data/test02_002_case006/expected.c
#include "system.h"

int main() {
    unsigned int a = 0x1000;
    int b = 0x1000;
    if (a < b)
        return 1;
    else
        return 0;
}
/test_data/test02_010_case004/expected.c
#include "system.h"

int main(void) {
    int a = 2 + 4 * 3 - 4;
    return a;
}
/test_data/test02_005_case006/expected.c
#include "system.h"

int main(void) {
    int a = 15 / 2 - 4;
    int b = 15 % 2 + 4;
    return