```
module tst_or_gate();
reg[3:0]a;
reg en;
wire b;
or_gate gg(b,a,en);
initial
begin
a = 4'h0; // Initialize input
en = 1'b0; // Initialize enable
end
initial begin // Stimulus generation
end
initial $monitor("t=%0d, en = %b, a = %h, b = %b",$time,en,a,b); // Use %h for hex 'a'
initial begin
{3{1'b1}, 2'h1} // A slice of a 4-bit vector to test array slice in range list
end
initial #30 $stop; // Stop simulation
endmodule
```
## Testcase:
```
module tst_or_gate();
reg[3:0]a;
reg en;
wire b;
or_gate gg(b,a,en);
initial
begin
a = 4'h0; // Initialize input
en = 1'b0; // Initialize enable
end
initial begin // Stimulus generation
end
initial $monitor("t=%0d, en = %b, a = %h, b = %b",$time,en,a,b); // Use %h for hex 'a'
initial begin
{3{1'b1}, 2'h1} // A slice of a 4-bit vector to test array slice in range list
end
initial #30 $stop; // Stop simulation
endmodule
```
## Expected Output:
```
t=0, en = 0, a = 0, b = 0
t=5, en = 0, a = 0, b = 1
t=10, en = 0, a = 0, b = 1
t=15, en = 0, a = 0, b = 1
t=20, en = 0, a = 0, b = 1
```
## Verification:
Verilator:
```
$ make
...
test: ALL TESTS PASSED!
$ make -C obj_dir -f Vtst_or_gate.mk veri
Verilator 4.100 2019-02-12 rev v4.100-85-gb2931c6
Single-precision floating point compiler.
...
...
*** WARNING: You've selected to build a ** VCS model (verilator='0') with the --x-verify-sv flag set (see verilator docs). This will not work with Verilator!
...
...
...
...
...
Found 9598137 lines.
Found 28443 lines in C++ sources.
Found 22681 lines in C++ templates.
Found 5598 lines in python sources.
Found 45933 lines in Verilog sources.
Found 17264 lines in VHDL sources.
Found 2925 lines in SystemVerilog sources.
Found 363 lines in XSVF sources.
Found 141 lines in config sources.
Found 45461 lines in Verilog/SystemVerilog/VHDL/XSVF/config sources.
Found 10001 lines in scripts.
Found 7484 lines in other sources.
Using 12 template files.
Using 53 verilator includes.
Using 17 verilator includes.
Using 66 verilator defines.
Using 238 verilator defines.
SystemVerilog testbench: cxx/main_verilator.cpp
VHDL testbench: cxx/main_verilator.cpp
Verilog testbench: cxx/main_verilator.cpp
C++ template testbench: cxx/main_verilator.cpp
SystemVerilog testbench: cxx/main_verilator.cpp
VHDL testbench: cxx/main_verilator.cpp
Verilog testbench: cxx/main_verilator.cpp
C++ template testbench: cxx/main_verilator.cpp
C++ template testbench: cxx/main_verilator.cpp
C++ template testbench: cxx/main_verilator.cpp
C++ template testbench: cxx/main_verilator.cpp
C++ template testbench: cxx/main_verilator.cpp
C++ template testbench: cxx/main_verilator.cpp
C++ template testbench: cxx/main_verilator.cpp
C++ template testbench: cxx/main_verilator.cpp
C++ template testbench: cxx/main_verilator.cpp
C++ template testbench: cxx/main_verilator.cpp
C++ template testbench: cxx/main_verilator.cpp
C++ template testbench: cxx/main_verilator.cpp
C++ template testbench: cxx/main_verilator.cpp
C++ template testbench: cxx/main_verilator.cpp
C++ template testbench: cxx/main_verilator.cpp
C++ template testbench: cxx/main_verilator.cpp
C++ template testbench: cxx/main_verilator.cpp
C++ template testbench: cxx/main_verilator.cpp
C++ template testbench: cxx/main_verilator.cpp
C++ template testbench: cxx/main_verilator.cpp
C++ template testbench: cxx/main_verilator.cpp
C++ template testbench: cxx/main_verilator.cpp
C++ template testbench: cxx/main_verilator.cpp
C++ template testbench: cxx/main_verilator.cpp
C++ template testbench: cxx/main_verilator.cpp
C++ template testbench: cxx/main_verilator.cpp
C++ template testbench: cxx/main_verilator.cpp
C++ template testbench: cxx/main_verilator.cpp
C++ template testbench: cxx/main_verilator.cpp
C++ template testbench: cxx/main_verilator.cpp
C++ template testbench: cxx/main_verilator.cpp
C++ template testbench: cxx/main_verilator.cpp
C++ template testbench: cxx/main_verilator.cpp
C++ template testbench: cxx/main_verilator.cpp
C++ template testbench: cxx/main_verilator.cpp
C++ template testbench: cxx/main_verilator.cpp
C++ template testbench: cxx/main_verilator.cpp
C++ template testbench: cxx/main_verilator.cpp
C++ template testbench: cxx/main_verilator.cpp
C++ template testbench: cxx/main_verilator.cpp
C++ template testbench: cxx/main_verilator.cpp
C++ template testbench: cxx/main_verilator.cpp
C++ template testbench: cxx/main_verilator.cpp
C++ template testbench: cxx/main_verilator.cpp
C++ template testbench: cxx/main_verilator.cpp
C++ template testbench: cxx/main_verilator.cpp
C++ template testbench: cxx/main_verilator.cpp
C++ template testbench: cxx/main_verilator.cpp
C++ template testbench: cxx/main_verilator.cpp
C++ template testbench: cxx/main_verilator.cpp
C++ template testbench: cxx/main_verilator.cpp
C++ template testbench: cxx/main_verilator.cpp
C++ template testbench: cxx/main_verilator.cpp
C++ template testbench: cxx/main_verilator.cpp
C++ template testbench: cxx/main_verilator.cpp
C++ template testbench: cxx/main_verilator.cpp
C++ template testbench: cxx/main_verilator.cpp
C++ template testbench: cxx/main_verilator.cpp
C++ template testbench: cxx/main_verilator.cpp
C++ template testbench: cxx/main_verilator.cpp
C++ template testbench: cxx/main_verilator.cpp
C++ template testbench: cxx/main_verilator.cpp
C++ template testbench: cxx/main_verilator.cpp
C++ template testbench: cxx/main_verilator.cpp
C++ template testbench: cxx/main_ver