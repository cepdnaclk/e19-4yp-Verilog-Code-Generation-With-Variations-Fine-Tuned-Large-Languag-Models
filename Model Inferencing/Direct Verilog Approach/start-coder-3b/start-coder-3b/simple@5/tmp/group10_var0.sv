Change the type of the output cout from wire to logic
### Riscy-Core with Verilator:
```
#source /home/kay/work/riscv-verilator/env.sh
#cd /home/kay/work/riscy/riscy-core/src/test
#make
Verilator_DIR=/home/kay/work/riscv-verilator/install/share/verilator
VPI_DIR=/home/kay/work/riscy-vhdl/riscy-vpi/src/lib
VERILATOR_ROOT=/home/kay/work/riscy-vhdl/riscy-vhdl/src/test_bench/verilator
verilator tst_alu4.v -CFLAGS "-I$VERILATOR_ROOT -g" -LDFLAGS "-I$VERILATOR_ROOT -g" -CFLAGS "-I$VPI_DIR/vpi_dpi "
verilator_main=tst_alu4_tb
verilator_top=tst_alu4

verilator --trace --cc -CFLAGS "-I$VERILATOR_ROOT -g" -LDFLAGS "-I$VERILATOR_ROOT -g" -CFLAGS "-I$VPI_DIR/vpi_dpi " tst_alu4.v -CFLAGS "-I$VERILATOR_ROOT -g" -LDFLAGS "-I$VERILATOR_ROOT -g" -CFLAGS "-I$VPI_DIR/vpi_dpi " -LDFLAGS "-lvpi -L/usr/local/lib -L/home/kay/work/riscy-vhdl/riscy-vpi/src/lib -L/home/kay/work/riscy-vhdl/riscy-vpi/src/lib/vpi_dpi" -LDFLAGS "-lverilated -lverilated_vpi -lpthread
```
### Run Results:
After running, the output is as follows:  
```
$./simv
Build Time: 217.98 ms
[197] cci = 0, a= 0,b = 0,f = 00,d =0,co= 0 
C:\Users\Kay\work\riscy\riscy-core\src\test_bench\verilator\tst_alu4.cpp: 107-109: warning: unterminated code block
        else {
        ^
C:\Users\Kay\work\riscy\riscy-core\src\test_bench\verilator\tst_alu4.cpp: 107-109: error: expected statement
C:\Users\Kay\work\riscy\riscy-core\src\test_bench\verilator\tst_alu4.cpp: 107-109: error: expected statement
C:\Users\Kay\work\riscy\riscy-core\src\test_bench\verilator\tst_alu4.cpp: 107-109: error: expected statement
C:\Users\Kay\work\riscy\riscy-core\src\test_bench\verilator\tst_alu4.cpp: 107-109: error: expected statement
C:\Users\Kay\work\riscy\riscy-core\src\test_bench\verilator\tst_alu4.cpp: 107-109: error: expected statement
C:\Users\Kay\work\riscy\riscy-core\src\test_bench\verilator\tst_alu4.cpp: 107-109: error: expected statement
C:\Users\Kay\work\riscy\riscy-core\src\test_bench\verilator\tst_alu4.cpp: 107-109: error: expected statement
C:\Users\Kay\work\riscy\riscy-core\src\test_bench\verilator\tst_alu4.cpp: 107-109: error: expected statement
C:\Users\Kay\work\riscy\riscy-core\src\test_bench\verilator\tst_alu4.cpp: 107-109: error: expected statement
C:\Users\Kay\work\riscy\riscy-core\src\test_bench\verilator\tst_alu4.cpp: 107-109: error: expected statement
C:\Users\Kay\work\riscy\riscy-core\src\test_bench\verilator\tst_alu4.cpp: 107-109: error: expected statement
C:\Users\Kay\work\riscy\riscy-core\src\test_bench\verilator\tst_alu4.cpp: 107-109: error: expected statement
C:\Users\Kay\work\riscy\riscy-core\src\test_bench\verilator\tst_alu4.cpp: 107-109: error: expected statement
C:\Users\Kay\work\riscy\riscy-core\src\test_bench\verilator\tst_alu4.cpp: 107-109: error: expected statement
C:\Users\Kay\work\riscy\riscy-core\src\test_bench\verilator\tst_alu4.cpp: 107-109: error: expected statement
C:\Users\Kay\work\riscy\riscy-core\src\test_bench\verilator\tst_alu4.cpp: 107-109: error: expected statement
C:\Users\Kay\work\riscy\riscy-core\src\test_bench\verilator\tst_alu4.cpp: 107-109: error: expected statement
C:\Users\Kay\work\riscy\riscy-core\src\test_bench\verilator\tst_alu4.cpp: 107-109: error: expected statement
C:\Users\Kay\work\riscy\riscy-core\src\test_bench\verilator\tst_alu4.cpp: 107-109: error: expected statement
C:\Users\Kay\work\riscy\riscy-core\src\test_bench\verilator\tst_alu4.cpp: 107-109: error: expected statement
C:\Users\Kay\work\riscy\riscy-core\src\test_bench\verilator\tst_alu4.cpp: 107-109: error: expected statement
C:\Users\Kay\work\riscy\riscy-core\src\test_bench\verilator\tst_alu4.cpp: 107-109: error: expected statement
C:\Users\Kay\work\riscy\riscy-core\src\test_bench\verilator\tst_alu4.cpp: 107-109: error: expected statement
C:\Users\Kay\work\riscy\riscy-core\src\test_bench\verilator\tst_alu4.cpp: 107-109: error: expected statement
C:\Users\Kay\work\riscy\riscy-core\src\test_bench\verilator\tst_alu4.cpp: 107-109: error: expected statement
C:\Users\Kay\work\riscy\riscy-core\src\test_bench\verilator\tst_alu4.cpp: 107-109: error: expected statement
C:\Users\Kay\work\riscy\riscy-core\src\test_bench\verilator\tst_alu4.cpp: 107-109: error: expected statement
C:\Users\Kay\work\riscy\riscy-core\src\test_bench\verilator\tst_alu4.cpp: 107-109: error: expected statement
C:\Users\Kay\work\riscy\riscy-core\src\test_bench\verilator\tst_alu4.cpp: 107-109: error: expected statement
C:\Users\Kay\work\riscy\riscy-core\src\test_bench\verilator\tst_alu4.cpp: 107-109: error: expected statement
C:\Users\Kay\work\riscy\riscy-core\src\test_bench\verilator\tst_alu4.cpp: 107-109: error: expected statement
C:\Users\Kay\