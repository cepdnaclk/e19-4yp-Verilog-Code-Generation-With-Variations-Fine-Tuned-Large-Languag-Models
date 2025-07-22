```verilog
module Anding (input a, b, input [(W-1):0]{packed_ab}, output y);
and (y, a, b);
endmodule
```
### Result:
```verilog
module Anding (
    input a, b, input [(W-1):0]{packed_ab},
    output y);
and (y, a, b);
endmodule
```
### Verilog Behavioural Description:
The following code shows the behavioural description of the DFF module.
```verilog
initial begin
	// initial statements
	if (wr_n) {
		if (rd_n) y <= d;
		else y <= q;
	}
end
```
### VHDL Behavioural Description:
The following code shows the behavioural description of the DFF module.
```vhdl
process (wr_n, rd_n)
begin
	if wr_n = '1' then
		if rd_n = '1' then
			y <= d;
		else
			y <= q;
		end if;
	end if;
end process;
```/hw/hdl/examples/dffs/vhdl/Makefile
.PHONY: all
all: dff

.PHONY: clean
clean:
	rm -rf verilog
	rm -rf vhdl


.PHONY: dff
dff:
	mkdir -p verilog
	mkdir -p vhdl
	for i in *.v; do \
		echo "====> Converting: $$i"; \
		python../../../vhdl_to_verilog.py -i $$i -o verilog/$$i; \
		python../../../verilog_to_vhdl.py -i verilog/$$i -o vhdl/$$i; \
	done
/hw/hdl/examples/muxes/vhdl/Makefile
.PHONY: all
all: cmos_mux dff_mux alu_mux

.PHONY: clean
clean:
	rm -rf verilog
	rm -rf vhdl


.PHONY: cmos_mux
cmos_mux:
	mkdir -p verilog
	mkdir -p vhdl
	for i in *.v; do \
		echo "====> Converting: $$i"; \
		python../../../vhdl_to_verilog.py -i $$i -o verilog/$$i; \
		python../../../verilog_to_vhdl.py -i verilog/$$i -o vhdl/$$i; \
	done

.PHONY: dff_mux
dff_mux:
	mkdir -p verilog
	mkdir -p vhdl
	for i in *.v; do \
		echo "====> Converting: $$i"; \
		python../../../vhdl_to_verilog.py -i $$i -o verilog/$$i; \
		python../../../verilog_to_vhdl.py -i verilog/$$i -o vhdl/$$i; \
	done

.PHONY: alu_mux
alu_mux:
	mkdir -p verilog
	mkdir -p vhdl
	for i in *.v; do \
		echo "====> Converting: $$i"; \
		python../../../vhdl_to_verilog.py -i $$i -o verilog/$$i; \
		python../../../verilog_to_vhdl.py -i verilog/$$i -o vhdl/$$i; \
	done
/hw/hdl/examples/adder/Makefile
.PHONY: all
all: cmos_adder carry_adder

.PHONY: clean
clean:
	rm -rf verilog
	rm -rf vhdl


.PHONY: cmos_adder
cmos_adder:
	mkdir -p verilog
	mkdir -p vhdl
	for i in *.v; do \
		echo "====> Converting: $$i"; \
		python../../vhdl_to_verilog.py -i $$i -o verilog/$$i; \
		python../../verilog_to_vhdl.py -i verilog/$$i -o vhdl/$$i; \
	done

.PHONY: carry_adder
carry_adder:
	mkdir -p verilog
	mkdir -p vhdl
	for i in *.v; do \
		echo "====> Converting: $$i"; \
		python../../vhdl_to_verilog.py -i $$i -o verilog/$$i; \
		python../../verilog_to_vhdl.py -i verilog/$$i -o vhdl/$$i; \
	done
/build.py
import os
import codecs
import glob
import subprocess
import argparse
import json
import random
import re
import logging

from lib import lib
from lib import build

from lib import __author__, __date__, __version__

def get_project_root_dir(path: str = "") -> str:
    """ Get the absolute path of the root of the project

    Return:
        The absolute path of the root of the project.
    """
    project_root_dir = os.path.abspath(os.path.join(os.getcwd(), os.path.dirname(__file__)))
    if path!= "" and os.path.exists(path):
        project_root_dir = os.path.abspath(os.path.join(project_root_dir, path))
    return project_root_dir

def get_test_cases_dir(path: str = "") -> str:
    """ Get the absolute path of the test case directory

    Return:
        The absolute path of the test case directory.
    """
    project_root_dir = get_project_root_dir()
    test_cases_dir = os.path.join(project_root_dir, "test_cases")
    if path!= "" and os.path.exists(path):
        test_cases_dir = os.path.join(test_cases_dir, path)
    return test_cases_dir

def get_vhdl_dir(path: str = "") -> str:
    """ Get the absolute path of the vhdl directory

    Return:
        The absolute path of the vhdl directory.
    """
    project_root_dir = get_project_root_dir()
    vhdl_dir = os.path.join(project_root_dir, "hw", "hdl", "examples")
    if path!= "" and os.path.exists(path):
        vhdl_dir = os.path.join(vhdl_dir, path)
    return vhdl_dir

def get_verilog_dir(path: str = "") -> str:
    """ Get the absolute path of the verilog directory

    Return:
        The absolute path of the verilog directory.
    """
    project_root_dir = get_project_root_dir()
    verilog_dir = os.path.join(project_root_dir, "hw", "hdl", "examples")
    if path!= "" and os.path.exists(path):
        verilog_dir = os.path.join(verilog_dir, path)
    return verilog_dir

def get_testbench_dir(path: str = "") -> str:
    """ Get the absolute path of the testbench directory

    Return:
        The absolute path of the testbench directory.
    """
    project_root_dir = get_project_root_dir()
    testbench_dir = os.path.join(project_root_dir, "tests", "testbenches")
    if path!= "" and os.path.exists(path):
        testbench_dir = os.path.join(testbench_dir, path)
    return testbench_dir

def get_design_dir(path: str = "") -> str:
    """ Get the absolute path of the design directory

    Return:
        The absolute path of the design directory.
    """
    project_root_dir = get_project_root_dir()
    design_dir = os.path.join(project_root_dir, "design")
    if path!= "" and os.path.exists(path):
        design_dir = os.path.join(design_dir, path)
    return design_dir

def get_simulation_dir(path: str = "") -> str:
    """ Get the absolute path of the simulation directory

    Return:
        The absolute path of the simulation directory.
    """
    project_root_dir = get_project_root_dir()
    simulation_dir = os.path.join(project_root_dir, "tests", "simulation")
    if path!= "" and os.path.exists(path):
        simulation_dir = os.path.join(simulation_dir, path)
    return simulation_dir

def get_tools_dir(path: str = "") -> str:
    """ Get the absolute path of the tools directory

    Return:
        The absolute path of the tools directory.
    """
    project_root_dir = get_project_root_dir()
    tools_dir = os.