`timescale 1ns/100ps
module maj3_p (input a, b, c, output y);
wire im1, im2, im3;
parameter
    tplh1=2, tphl1=4,
    tplh2=3, tphl2=5;
and #(tplh1, tphl1)
    (im1, a, b),
    (im2, b, c),
    (im3, c, a);
or #(tplh2, tphl2) (y, im1, im2, im3);
endmodule
```
</p></details>

<details><summary>Testbench</summary><p>

```verilog
`timescale 1ns/100ps

module testbench(input clk, output maj3);

// Inputs to 3-input majority function
wire a, b, c;

maj3_p maj3(
   .a(a),.b(b),.c(c),
   .y(maj3)
  );

always #5 clk = ~clk;

initial begin
  $display(maj3);
  $dumpfile("testbench.vcd");
  $dumpvars(0, testbench);
  #(1000);
  a = 0;
  b = 1;
  c = 0;
  #(5);
  a = 0;
  b = 0;
  c = 1;
  #(200);
  $dumpreset(0);
  $finish;

end

endmodule
```
</p></details>

## Verification

### Verilator
Verilator was used to verify the functionality of the design.

<details><summary>Make</summary><p>

```bash
make
```
</p></details>

<details><summary>Output</summary><p>

```bash
[main] Running verilator'verilator -I../v -I../../common -Mdir tb_maj3 -CFLAGS -g -Wno-lint -LDFLAGS -Wl,--no-relax -LDFLAGS -Wl,--no-relax -LDFLAGS -Wl,--no-relax -CFLAGS -O2 -O2 --exe tb_maj3.cpp'
Verilator  -- The Verilog OO Hardware Simulator
Copyright 2005-2020 ,, 
Copyright 2005-2020 ,,,, 
See COPYING.verilator for copyright information.

Command line args:
    --trace
    --sc
    --exe
    --Werror
    --quiet
    --lint-only
    --assert
    --trace-max-levels=1
    --top-module tb_maj3
    --Mdir tb_maj3
    --compiler gcc
    --trace-fst
    --error-limit 9999999
    --CC tb_maj3.cpp
    --CFLAGS -O2
    --LDFLAGS --no-relax
    --LDFLAGS --no-relax
    --LDFLAGS --no-relax
    --CFLAGS -g
    -Wno-lint
    --exe tb_maj3.cpp

Reading Verilog source(s)...
Preprocessing...
Running C-preprocessor...
Executing compiler...
Creating C++-source for verilated module tb_maj3
Compiling...
Linking...
Running simulation with Valgrind...
Memorized 91 lines in 1 files

===================== ASSERTION FAILED =====================
// Test case:
//   1 0 0 1
// Expected output:
//   0
// Actual output:
//   1
//
// Difference:
//   [1]
//
// Program finished with exit code 42
```
</p></details>

### Icarus Verilog
Icarus Verilog was used to verify the functionality of the design.

<details><summary>Make</summary><p>

```bash
make
```
</p></details>

<details><summary>Output</summary><p>

```bash
[main] Running iverilog 'iverilog -o tb_maj3 -I../v -I../../common tb_maj3.v'
Error:./tb_maj3.v(34): Assertion failed: (maj3 == 0)
Time: 0.000s  Iteration: 0
```
</p></details>

## Final Project: Majority Function for 3 Inputs

<details><summary>Base Verilog Code</summary><p>

```verilog
`timescale 1ns/100ps

module maj3_p (input a, b, c, output y);

endmodule
```
</p></details>

<details><summary>Testbench</summary><p>

```verilog
`timescale 1ns/100ps

module testbench(input clk, output maj3);

// Inputs to 3-input majority function
wire a, b, c;

maj3_p maj3(
   .a(a),.b(b),.c(c),
   .y(maj3)
  );

// Clock cycle input
always #5 clk = ~clk;

// Initial test case
initial begin
  $display(maj3);
  $dumpfile("testbench.vcd");
  $dumpvars(0, testbench);
  #(1000);
  a = 0;
  b = 1;
  c = 0;
  #(5);
  a = 0;
  b = 0;
  c = 1;
  #(200);
end

endmodule
```
</p></details>

## References
- [Verilator](https://www.veripool.org/wiki/verilator)
- [Verilator Documentation](https://www.veripool.org/projects/verilator/wiki/Manual)
- [Icarus Verilog](http://iverilog.icarus.com)
- [Icarus Verilog Documentation](https://iverilog.icarus.com/documentation/)
- [Tutorial 2: The Majority Function](https://www.veripool.org/tutorials/v_tut2.html)
/Assignments/10/Makefile
.PHONY: all
all:
	iverilog -o tb_10 -I../../common -I../ -Wall tb_10.v
	vvp tb_10

.PHONY: clean
clean:
	rm -f tb_10 *.log *.vcd

.PHONY: view-waveforms
view-waveforms:
	gtkwave tb_10.vcd
/Assignments/07/Makefile
.PHONY: all
all:
	make -C../../common
	iverilog -o tb_07 -I../../common -I../ -Wall tb_07.v
	vvp tb_07

.PHONY: clean
clean:
	rm -f tb_07 *.log *.vcd

.PHONY: view-waveforms
view-waveforms:
	gtkwave tb_07.vcd
/Assignments/08/Makefile
.PHONY: all
all:
	make -C../../common
	iverilog -o tb_08 -I../../common -I../ -Wall tb_08.v
	vvp tb_08

.PHONY: clean
clean:
	rm -f tb_08 *.log *.vcd

.PHONY: view-waveforms
view-waveforms:
	gtkwave tb_08.vcd
/Assignments/01/Makefile
.PHONY: all
all:
	make -C../../common
	iverilog -o tb_01 -I../../common -I../ -Wall tb_01.v
	vvp tb_01

.PHONY: clean
clean:
	rm -f tb_01 *.log *.vcd

.PHONY: view-waveforms
view-waveforms:
	gtkwave tb_01.vcd
/Assignments/09/Makefile
.PHONY: all
all:
	make -C../../common
	iverilog -o tb_09 -I../../common -I../ -Wall tb_09.v
	vvp tb_09

.PHONY: clean
clean:
	rm -f tb_09 *.log *.vcd

.PHONY: view-waveforms
view-waveforms:
	gtkwave tb_09.vcd
/README.md
# Computer Architecture

The course includes the following assignments.

- [Assignment 01](Assignments/01)
- [Assignment 02](Assignments/02)
- [Assignment 03](Assignments/03)
- [Assignment 04](Assignments/04)
- [Assignment 05](Assignments/05)
- [Assignment 06](Assignments/06)
- [