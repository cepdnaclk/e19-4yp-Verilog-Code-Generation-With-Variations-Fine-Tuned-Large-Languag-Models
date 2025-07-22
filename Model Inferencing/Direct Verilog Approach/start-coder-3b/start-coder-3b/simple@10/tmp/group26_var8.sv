module gade(a,a1,b,c,b1,c1);
output [7:0] a,a1;
output b,c,b1,c1;
// Instantiate OR gate with inertial delay 3
or #3 gg1(a1,c1,b1);
// Instantiate AND gate with rise=2, fall=1 inertial delay
and #(2,1) gg2(a,c,b);
endmodule
```
### Expected Behavior
Compilation is successful.
### Actual Behavior
```
ERROR: vlog_comp.bb:16:78: Instantiation of a(c1,b,-) failed.
```
/utils/verilog/README.md
# Verilog Utilities

This directory contains several utility scripts and functions to help with Verilog development.

* `vsim_wrapper.py`: a wrapper for vsim that adds support for Verilator (verilator.org) and Icarus (iverilog.icarus.com) simulators.
* `check_files.py`: check for various common error types in Verilog source files.
* `check_verilog_files.py`: a wrapper for the `check_files.py` script, specialized for Verilog source files.
* `generate_covergroup_testbench.py`: a wrapper for the `generate_testbench.py` script, specialized for Verilog covergroups.
* `generate_testbench.py`: generate a SystemVerilog testbench for a Verilog component.
* `remove_comments.py`: remove comments from Verilog source code files.
* `run_vsim`: a wrapper for vsim that adds a --run flag, and allows multiple vsim processes to be run in parallel.
* `run_vcs`: a wrapper for vcs that adds support for Verilator (verilator.org) and Icarus (iverilog.icarus.com) simulators.
* `run_vunit`: a wrapper for vunit that adds support for Verilator (verilator.org) and Icarus (iverilog.icarus.com) simulators.
* `run_xvlog`: a wrapper for xvlog that adds support for Verilator (verilator.org) and Icarus (iverilog.icarus.com) simulators.
* `run_yosys`: a wrapper for yosys that adds support for the Yosys Verilog backend.
* `test_verilog_files.py`: a wrapper for the `check_files.py` script, specialized for Verilog source files.
* `verilator_model_wrapper.py`: a wrapper for the Verilator C++ simulator that adds support for simulation options and output logging.
* `verilator_wrapper.py`: a wrapper for the Verilator C++ simulator.
* `vcs_model_wrapper.py`: a wrapper for the VCS simulator that adds support for simulation options and output logging.
* `vcs_wrapper.py`: a wrapper for the VCS simulator.
* `vunit_model_wrapper.py`: a wrapper for the VUnit simulator that adds support for simulation options and output logging.
* `vunit_wrapper.py`: a wrapper for the VUnit simulator.
* `xvlog_model_wrapper.py`: a wrapper for the Xilinx Vivado simulator that adds support for simulation options and output logging.
* `xvlog_wrapper.py`: a wrapper for the Xilinx Vivado simulator.
* `yosys_model_wrapper.py`: a wrapper for the Yosys simulator that adds support for simulation options and output logging.
* `yosys_wrapper.py`: a wrapper for the Yosys simulator.
* `yosys_verilog.py`: a wrapper for the Yosys Verilog backend that adds support for simulation options and output logging.
* `zsim.py`: a wrapper for the zsim simulator.

The `run_vcs`, `run_vunit`, and `run_xvlog` scripts all use the vcs, vunit, and xvlog simulators, respectively.

The `verilog_test.py` script uses the `run_vcs`, `run_vunit`, `run_xvlog`, and `run_yosys` scripts to perform a complete functional verification suite for Verilog source files.

The `vsim_wrapper.py` script uses the `run_vsim` script to perform a complete simulation suite for Verilog source files.

The `verilator_wrapper.py` script uses the Verilator C++ simulator to perform a complete simulation suite for Verilog source files.

## Installing Verilator, VUnit, and Yosys

Each of these scripts use a specific version of the corresponding simulator. To install the simulator, run the appropriate command:

* Verilator: `pip install verilator`
* VUnit: `pip install vunit`
* Yosys: `pip install yosys`

## Running Verilator, VUnit, and Yosys Simulators

Each of these scripts (along with the `run_vsim` script) use a specific tool to perform a simulation. To run the simulator, run the appropriate command:

* Verilator: `verilator`
* VUnit: `vunit`
* Yosys: `yosys`

The `run_vsim` script uses the Vivado simulator (xvlog) to run the Vivado simulation. You can use another simulator by modifying the `SIM` environment variable in these scripts.

## Running Verilog Simulation Scripts

The `run_vsim` and `verilog_test.py` scripts both use the `run_vsim` script to perform a simulation. To run the simulator, run the appropriate command:

```
$ run_vsim --version
```
## Running Verilog Verification Scripts

The `verilog_test.py` script uses the `run_vcs` and `run_vunit` scripts to perform a complete functional verification suite for Verilog source files. To run the verification, run the appropriate command:

```
$ verilog_test.py --version
```

The `run_vcs`, `run_vunit`, and `run_xvlog` scripts use the `vcs`, `vunit`, and `xvlog` simulators, respectively. Since the Vivado simulator (xvlog) is used by the `run_vsim` script, these scripts should be run with the `SIM` environment variable set to `vsim`. In this case, a separate Vivado installation is not required.

The `verilog_test.py` script does not use the `run_vcs`, `run_vunit`, or `run_xvlog` scripts.

The `run_vsim` script uses the Vivado simulator (xvlog) to run the Vivado simulation. You can use another simulator by modifying the `SIM` environment variable. To run the simulator, run the appropriate command:

```
$ run_vsim --version
```

## Installing Verilator, VUnit, and VCS/Icarus

```
$ pip install verilator
$ pip install vunit
```

## Running Verilator, VUnit, and VCS/Icarus Simulations

```
$ vcs --version
```

## Running Verilog Simulation Scripts

```
$ run_vcs --version
$ run_vunit --version
$ run_xvlog --version
$ run_yosys --version
```

## Running Verilog Verification Scripts

```
$ verilog_test.py --version
```

## Python Syntax

Each script uses Python syntax to perform various tasks. You can run a script using the following command:

```
$ python path/to/script.py
```

Here are some useful Python syntax commands that can be used in scripts:

* `print`: print an output message to the console.
* `sys.argv`: a list of command-line arguments passed to the script.
* `sys.exit`: exit the script with a given exit status code.
* `sys.path`: a list of paths to search for Python source files.
* `sys.stdout`: an object representing.0
#include <verilog_file.vh>

// Set the path to the Verilator header file
#include <verilated.h>

// Set the path to the Verilator model file
#include <verilator_model.cpp>

// Create a new Verilator model
Testbench* testbench = new Testbench;

// Run the Verilator simulation
int main(int argc, char** argv) {
  Verilated::commandArgs(argc, argv);
  testbench->run();
  return 0;
}
```

## Yosys

```verilog
module testbench;
  input a;
  input b;
  output a1;
  output b1;
  logic a1_;
  logic b1_;
  reg [3:0] state;
  or #(.t