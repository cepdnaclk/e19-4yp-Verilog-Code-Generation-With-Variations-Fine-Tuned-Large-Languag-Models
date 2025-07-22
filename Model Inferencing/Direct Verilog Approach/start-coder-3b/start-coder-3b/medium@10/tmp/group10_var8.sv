#include "verilated.h"
#include <iostream>
#include "Vreg4.h"

VL_MODULE(Vreg4)
{
    // Ports
    VL_IN8(Clock,0,0);
    VL_IN8(Resetn,0,0);
    VL_IN(D,3,0);
    VL_OUT(Q,3,0);

    // Internals
    VL_REG(Q,3,0);

always_ff @(posedge Clock or negedge Resetn) begin
    if (Resetn == 0)
        Q = 0;
    else
        Q = D;
end

endmodule
### Simulation Results:
![](https://github.com/zxycsu/Verilog_Test/blob/master/Result.png)
### Verilog Design Files
[reg4.v](https://github.com/zxycsu/Verilog_Test/blob/master/reg4.v)
### VHDL Design
[reg4.vhd](https://github.com/zxycsu/Verilog_Test/blob/master/reg4.vhd)
### Run Demo
```
cd../verilator
make -j4
cd../sim
./reg4
```
/README.md
# Verilog Test
## Introduction
Verilog is a hardware description language with a structured imperative n/Verilog/blob/master/reg4/demo.png)
### Verilog Code
[reg4.v](https://github.com/zxycsu/Verilog_Test/blob/master/Verilog/reg4/reg4.v)
### Run Demo
```
cd../verilator
make -j4
cd../sim
./reg4
```
control flow and constructs aiming to provide simple and extensible hardware description. The language is used in the Verilog simulator which can simulate the behavior of hardware devices.
## Verilog Files
### reg4
![](https://github.com/zxycsu/Verilog_Test/blob/master/Verilog/reg4/result.png)
### reg8
![](https://github.com/zxycsu/Verilog_Test/blob/master/Verilog/reg8/result.png)
## VHDL Files
### reg16
![](https://github.com/zxycsu/Verilog_Test/blob/master/VHDL/reg16/vhdl.png)
## Simulation Files
### reg4
![](https://github.com/zxycsu/Verilog_Test/blob/master/sim/reg4/demo.png)
### reg8
![](https://github.com/zxycsu/Verilog_Test/blob/master/sim/reg8/demo.png)
## Verilator Files
### reg4
![](https://github.com/zxycsu/Verilog_Test/blob/master/verilator/reg4/demo.png)
### reg8
![](https://github.com/zxycsu/Verilog_Test/blob/master/verilator/reg8/demo.png)
## VHDL Simulation Files
### reg16
![](https://github.com/zxycsu/Verilog_Test/blob/master/VHDL/reg16/demo.png)
## VHDL Verilator Files
### reg4
![](https://github.com/zxycsu/Verilog_Test/blob/master/verilator/reg4/demo.png)
### reg8
![](https://github.com/zxycsu/Verilog_Test/blob/master/verilator/reg8/demo.png)
## VHDL SimVerilator Files
### reg16
![](https://github.com/zxycsu/Verilog_Test/blob/master/SimVerilator/VHDL/reg16/demo.png)
## Verilator Simulation Files
### reg4
![](https://github.com/zxycsu/Verilog_Test/blob/master/verilator/reg4/demo.png)
### reg8
![](https://github.com/zxycsu/Verilog_Test/blob/master/verilator/reg8/demo.png)
## VHDL SimVerilator Files
### reg16
![](https://github.com/zxycsu/Verilog_Test/blob/master/SimVerilator/VHDL/reg16/demo.png)
## Verilator Simulation Files
### reg4
![](https://github.com/zxycsu/Verilog_Test/blob/master/verilator/reg4/demo.png)
### reg8
![](https://github.com/zxycsu/Verilog_Test/blob/master/verilator/reg8/demo.png)
## VHDL SimVerilator Files
### reg16
![](https://github.com/zxycsu/Verilog_Test/blob/master/SimVerilator/VHDL/reg16/demo.png)
## VHDL SimVerilator Files
### reg16
![](https://github.com/zxycsu/Verilog_Test/blob/master/SimVerilator/VHDL/reg16/demo.png)
## Verilator Simulation Files
### reg4
![](https://github.com/zxycsu/Verilog_Test/blob/master/verilator/reg4/demo.png)
### reg8
![](https://github.com/zxycsu/Verilog_Test/blob/master/verilator/reg8/demo.png)
## VHDL SimVerilator Files
### reg16
![](https://github.com/zxycsu/Verilog_Test/blob/master/SimVerilator/VHDL/reg16/demo.png)
## Verilator Simulation Files
### reg4
![](https://github.com/zxycsu/Verilog_Test/blob/master/verilator/reg4/demo.png)
### reg8
![](https://github.com/zxycsu/Verilog_Test/blob/master/verilator/reg8/demo.png)
## VHDL SimVerilator Files
### reg16
![](https://github.com/zxycsu/Verilog_Test/blob/master/SimVerilator/VHDL/reg16/demo.png)
## Verilator Simulation Files
### reg4
![](https://github.com/zxycsu/Verilog_Test/blob/master/verilator/reg4/demo.png)
### reg8
![](https://github.com/zxycsu/Verilog_Test/blob/master/verilator/reg8/demo.png)
## VHDL SimVerilator Files
### reg16
![](https://github.com/zxycsu/Verilog_Test/blob/master/SimVerilator/VHDL/reg16/demo.png)
## Verilator Simulation Files
### reg4
![](https://github.com/zxycsu/Verilog_Test/blob/master/verilator/reg4/demo.png)
### reg8
![](https://github.com/zxycsu/Verilog_Test/blob/master/verilator/reg8/demo.png)
## VHDL SimVerilator Files
### reg16
![](https://github.com/zxycsu/Verilog_Test/blob/master/SimVerilator/VHDL/reg16/demo.png)
## Verilator Simulation Files
### reg4
![](https://github.com/zxycsu/Verilog_Test/blob/master/verilator/reg4/demo.png)
### reg8
![](https://github.com/zxycsu/Verilog_Test/blob/master/verilator/reg8/demo.png)
## VHDL SimVerilator Files
### reg16
![](https://github.com/zxycsu/Verilog_Test/blob/master/SimVerilator/VHDL/reg16/demo.png)
## Verilator Simulation Files
### reg4
![](https://github.com/zxycsu/Verilog_Test/blob/master/verilator/reg4/demo.png)
### reg8
![](https://github.com/zxycsu/Verilog_Test/blob/master/verilator/reg8/demo.png)
## VHDL SimVerilator Files
### reg16
![](https://github.com/zxycsu/Verilog_Test/blob/master/SimVerilator/VHDL/reg16/demo.png)
## Verilator Simulation Files
### reg4
![](https://github.com/zxycsu/Verilog_Test/blob/