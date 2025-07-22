module RAM (output[7:0] Obus, input[7:0] Ibus, input[3:0] Adr, input Clk, Read);
reg[7:0] Storage[15:0];
reg[7:0] ObusReg;
assign #1 Obus = ObusReg;
initial
always @(posedge Clk)
begin
int i;
i=0;
while (i <= 15)
Storage[i] <= Ibus;
i=i+1;
end
assign ObusReg = Storage[Adr];
endmodule
### Results:

### Analysis of Results:
In the code above, we have introduced a while loop, which will run till i is less than or equal to 15. Since the array index start from 0, the loop will run till 15. Now, in the line where oBusReg is assigned to the Storage[Adr], Storage[15] is assigned to Obusreg, since at the end of the loop Storage[15] is assigned the value of the last variable, which is Ibus, which is the input from user.

### Conclusion:  
In this experiment, we have learned to write while loop condition and how it works.

![alt text](https://github.com/prasannakumars01/ECE545_Digital_System_Verification/blob/master/Images_Experiment/Experiment_13_1.PNG)
![alt text](https://github.com/prasannakumars01/ECE545_Digital_System_Verification/blob/master/Images_Experiment/Experiment_13_2.PNG)

/Experiments/Experiment_2/experiment2_Q2/testbench.c
#include <stdio.h>
#include "verilated.h"
#include "Vexperiment.h"

int main(int argc, char** argv) {
	printf("*** Verilog Formal Testbench\n\n");
	Vexperiment* top = new Vexperiment;
	Verilated::traceEverOn(true);
	VerilatedVcdC* tfp = new VerilatedVcdC;
	top->trace(tfp,99);
	tfp->open("trace2.vcd");
    
    printf("*** Initializing Verilog Testbench\n\n");
    top->I_op=0;
    top->I_inp1=0;
    top->I_inp2=0;
    top->clk=0;
    top->eval();
    
    printf("*** Starting Verilog Testbench\n\n");
    tfp->dump(0);
    for(int i=0;i<10;i++){
        top->clk=!top->clk;
        top->eval();
        if(i%8==0) printf("clk=%u",top->clk);
        if(i%8==3) printf(" inp1=%u",top->I_inp1);
        if(i%8==7) printf(" inp2=%u",top->I_inp2);
        printf("\n");
        tfp->dump(i*10);
    }
    tfp->close();
	delete top;
}
/Experiments/Experiment_5/Experiment_5_Q1/Makefile
TOP_MODULE=experiment

include../../Common/Makefile.inc

all: compile testbench run

compile:
	$(VVP) testbench.c $(TOP_MODULE).v

testbench:
	$(VVP) testbench.c $(TOP_MODULE).v

run:
	$(GTKWAVE) trace.vcd
	$(GTKWAVE) trace2.vcd
	$(GTKWAVE) trace3.vcd
	$(GTKWAVE) trace4.vcd
	$(GTKWAVE) trace5.vcd

clean:
	$(RM) -f *.vcd *.log *.dat t $(RM) -rf *.dSYM
estbench

cleanall: clean
	$(RM) -f *~

.PHONY: all compile testbench run clean cleanall

.PHONY: compile

compile:
	$(VVP) testbench.c $(TOP_MODULE).v

testbench:
	$(VVP) testbench.c $(TOP_MODULE).v

run:
	$(GTKWAVE) trace.vcd
	$(GTKWAVE) trace2.vcd
	$(GTKWAVE) trace3.vcd
	$(GTKWAVE) trace4.vcd
	$(GTKWAVE) trace5.vcd

clean:
	$(RM) -f *.vcd *.log *.dat testbench

cleanall: clean
	$(RM) -f *~

.PHONY: cleanall

cleanall: clean
	$(RM) -f *~
	$(RM) -rf build
	$(RM) -rf __pycache__
	$(RM) -rf _pycache
	$(RM) -rf.pytest_cache
	$(RM) -rf build
	$(RM) -rf dist
	$(RM) -rf.eggs
	$(RM) -rf.tox
	$(RM) -rf.cache
	$(RM) -rf.pytest_cache
	$(RM) -rf build
	$(RM) -rf dist
	$(RM) -rf.eggs
	$(RM) -rf.tox
	$(RM) -rf.coverage
	$(RM) -rf env
	$(RM) -rf.env
	$(RM) -rf.pytest_cache
	$(RM) -rf env
	$(RM) -rf.env
	$(RM) -rf.tox
	$(RM) -rf.coverage
	$(RM) *.pyc
	$(RM) -rf *.dSYM

.PHONY: clean

clean:
	$(RM) -f *.vcd *.log *.dat testbench

.PHONY: cleanall

cleanall: clean
	$(RM) -f *~
	$(RM) -rf build
	$(RM) -rf __pycache__
	$(RM) -rf _pycache
	$(RM) -rf.pytest_cache
	$(RM) -rf build
	$(RM) -rf dist
	$(RM) -rf.eggs
	$(RM) -rf.tox
	$(RM) -rf.cache
	$(RM) -rf.pytest_cache
	$(RM) -rf build
	$(RM) -rf dist
	$(RM) -rf.eggs
	$(RM) -rf.tox
	$(RM) -rf.coverage
	$(RM) -rf env
	$(RM) -rf.env
	$(RM) -rf.pytest_cache
	$(RM) -rf env
	$(RM) -rf.env
	$(RM) -rf.tox
	$(RM) -rf.coverage
	$(RM) *.pyc
	$(RM) -rf *.dSYM

.PHONY: cleanall

cleanall: clean
	$(RM) -f *~
	$(RM) -rf build
	$(RM) -rf __pycache__
	$(RM) -rf _pycache
	$(RM) -rf.pytest_cache
	$(RM) -rf build
	$(RM) -rf dist
	$(RM) -rf.eggs
	$(RM) -rf.tox
	$(RM) -rf.cache
	$(RM) -rf.pytest_cache
	$(RM) -rf build
	$(RM) -rf dist
	$(RM) -rf.eggs
	$(RM) -rf.tox
	$(RM) -rf.coverage
	$(RM) -rf env
	$(RM) -rf.env
	$(RM) -rf.pytest_cache
	$(RM) -rf env
	$(RM) -rf.env
	$(RM) -rf.tox
	$(RM) -rf.coverage
	$(RM) *.pyc
	$(RM) -rf *.dSYM


clean:
	$(RM) -f *.vcd *.log *.dat testbench

cleanall: clean
	$(RM) -f *~
	$(RM) -rf build
	$(RM) -rf __pycache__
	$(RM) -rf _pycache
	$(RM) -rf.pytest_cache
	$(RM) -rf build
	$(RM) -rf dist
	$(RM) -rf.eggs
	$(RM) -rf.tox
	$(RM) -rf.cache
	$(RM) -rf.pytest_cache
	$(RM) -rf build
	$(RM) -rf dist
	$(RM) -rf.eggs
	$(RM) -rf.tox
	$(RM) -rf.coverage
	$(RM) -rf env
	$(RM) -rf.env
	$(RM) -rf.pytest_cache
	$(RM) -rf env
	$(RM) -rf.env