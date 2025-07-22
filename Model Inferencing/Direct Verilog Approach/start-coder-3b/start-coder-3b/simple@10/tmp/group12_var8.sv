--- a/3.31/example1.sv
+++ b/3.31/example1.sv
@@ -5,7 +5,7 @@
   logic [3:0] sum;
   always_ff @(posedge clk) begin
     if (di) begin
-      reg [3:0] a, b;
+      logic [3:0] a, b;
       a = b;
     end
   end
@@ -15,7 +15,7 @@
   assign sum = a + b;
 endmodule
 
-module Testbench(input clk, input [3:0] di, output [3:0] sum);
+module Testbench(input clk, input [3:0] di, output [3:0] sum);
   reg [3:0] a, b, c;
   initial begin
     a = 1'b1;
@@ -28,7 +28,7 @@
     #9;
   end
   initial #10;
-  logic [3:0] d;
+  logic [3:0] d;
   always_ff @(posedge clk) begin
     if (di) begin
       d <= #1 a + b + c;

### Expected Behavior:
SystemVerilog compatibility is not enforced.
### Actual Behavior:
In this case, the code fails to compile because it uses reg instead of logic.
### SystemVerilog Code:
--- a/3.31/example1.sv
+++ b/3.31/example1.sv
@@ -5,7 +5,7 @@
   logic [3:0] sum;
   always_ff @(posedge clk) begin
     if (di) begin
-      reg [3:0] a, b;
+      logic [3:0] a, b;
       a = b;
     end
   end
@@ -15,7 +15,7 @@
   assign sum = a + b;
 endmodule
 
-module Testbench(input clk, input [3:0] di, output [3:0] sum);
+module Testbench(input clk, input [3:0] di, output [3:0] sum);
   reg [3:0] a, b, c;
   initial begin
     a = 1'b1;


### Steps to Reproduce the Problem:
Run the included testbench.
### Expected Result:
Program should compile.
### Actual Result:
Program fails to compile.

### Extra Information & Screenshots:
This is a valid test case.  It is possible to run this code in SystemVerilog and Verilog, as shown below.

Note:  I am currently working on other test cases.
/3.31/example2.c
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <stdint.h>

int main() {
  char *s = "Hello";
  char *t = "World";
  char *u = malloc(strlen(s) + strlen(t) + 1);
  strcpy(u, s);
  strcat(u, t);
  printf("%s\n", u);

  return 0;
}
r.

If you are using a Windows machine with Mingw-w64/MSYS2, there is a script file for getting everything working.
```
/cygdrive/c/Users/YourUser/Documents/tools/Mingw-w64/MSYS2/msys2_shell.cmd
```

## Compiling
To compile a C source file, use the following:
```
gcc -O3 -o your-program-name.exe your-source-file.c
```

## Sample Program
```
#include <stdio.h>
#include <stdlib.h>

int main() {
  char *s = "Hello";
  char *t = "World";
  char *u = malloc(strlen(s) + strlen(t) + 1);
  strcpy(u, s);
  strcat(u, t);
  printf("%s\n", u);

  return 0;
}
```

## Running
```
./your-program-name.exe
```

### Results
```
Hello World
```

## Issues
* You may need to change the include paths.
/README.md
# SystemVerilog vs C

Here I will be compiling and running C code in SystemVerilog and comparing the results.

## Pre-Requisites

Make sure you have:
* [Verilator](https://www.veripool.org/wiki/verilator)
* [GTKWave](https://github.com/gtkwave/gtkwave)
* [Mingw-w64/MSYS2](https://www.msys2.org/)
* [Icarus Verilog](https://gitlab.com/icarus-verilog/icarus-verilog)

### Getting Started

Start by cloning the repo:
```
git clone https://github.com/briancwelch/systemverilog-vs-c.git
```

#### Mingw-w64/MSYS2

I prefer to use MSYS2 for Windows.  In this directory is a script file for getting everything working.  If you would like to use a different C compiler, you will need to change the path to gcc in the script.  The script also includes a link to the Verilator installation folde/3.31/example3.c
#include <stdio.h>
#include <stdlib.h>

int main() {
  int *x = malloc(sizeof(int));
  *x = 5;
  int *y = malloc(sizeof(int));
  *y = 3;
  int *z = malloc(sizeof(int));
  *z = *x * *y;
  printf("%d\n", *z);
  return 0;
}