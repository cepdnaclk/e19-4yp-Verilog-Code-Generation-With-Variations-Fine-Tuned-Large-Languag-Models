module mixed_sim;
reg dcontrol, x, y;
reg [31:0] data;
wire [31:0] bus;
assign bus = dcontrol? data : 'bz;
dcontrol_state_Mealy_inside_t dcontrol_state_Mealy_inside = $dcontrol_state_Mealy_inside_t(dcontrol);
always @x
y = ~x;
initial
begin
$monitor("time=%d dcontrol=%d data=%d x=%d y=%d bus=%d",
         $time, dcontrol, data, x, y, bus);
dcontrol = 0;
end
endmodule
```
# [01] Verilator

The C++ RTL simulator, [Verilator](https://verilator.org/), supports a variety of synthesizable languages. Verilator is included with Vivado, so as long as the synthesis tool can generate the VHDL/SystemVerilog code, Verilator can be used.

# Requirements

Verilator 4.101+ is used in the course.

# Installation

* Install [Verilator](https://verilator.org/download/)
* Install [Vivado](https://www.xilinx.com/products/design-tools/vivado.html)
  * Vivado 2018.3 (you can download the free evaluation version here for personal use)
  * Be sure to select the option to install the Vivado Design Suite
* Create a new workspace in Vivado
  * Select 'File' -> 'Open' -> 'Select Workspace Directory'
  * Navigate to the workspace folder, or create a new one
  * Close the project window (`Ctrl+W`)

# Usage

## Generate Verilog

* Open Vivado
* In the toolbar, select 'File' -> 'Open Project'
  * Navigate to the workspace folder, or create a new one
* In the projects window, select 'Project', then 'Generate Block Design'
  * Select the 'RTL Source Files' tab
  * Select 'Add File...'
  * Select the top level file, for example `Top_module.v`
  * Click the 'Generate' button
* In the projects window, select 'Project', then 'Generate RTL Design'
  * Check the boxes for the required IPs (for example, `altera_primitives`)
  * Click the 'Generate' button
* In the projects window, select 'Project', then 'Rebuild Target'
  * Check the boxes for the required IPs (for example, `altera_primitives`)
  * Click the 'Rebuild' button
  * Select 'Generate Output Files'
  * Select 'RTL File', 'SystemVerilog Interface File', 'SystemVerilog Module File'
    * File names and path can be modified, but be sure to place these files in the proper places

## Run Verilator

* Run the following command from the project directory

```bash
verilator --trace -CFLAGS -g --top-module top_module --cc --exe --sv --sv-intf UartIF --exe Top_module.cpp
```

* The Verilator executable is named `Vtop_module`
* In the same directory, open the `out_dir/Vtop_module.cpp` file in a text editor
* You will see code that looks like this:

```cpp
int main(int argc, char** argv, char** env) {
    Verilated::commandArgs(argc, argv);
    Verilated::traceEverOn(true);
    Top_module *top_module = new Top_module;
    VerilatedVcdC* tfp = new VerilatedVcdC;
    VerilatedVcdC* tfp_uart = new VerilatedVcdC;
    top_module->trace(tfp, 99);
    top_module->uart_interface->trace(tfp_uart, 99);
    top_module->clk = 0;
    top_module->rstb = 0;
    top_module->uart_interface->rstb = 0;
    top_module->uart_interface->uart_tx = 0;
    top_module->uart_interface->uart_rx = 0;


    tfp->open("top_module.vcd");
    tfp_uart->open("uart_interface.vcd");

    for (int i = 0; i < 20; ++i) {
        top_module->clk = 0;
        tfp->dump(i*2);
        tfp_uart->dump(i*2);
        top_module->eval();
        top_module->clk = 1;
        tfp->dump(i*2 + 1);
        tfp_uart->dump(i*2 + 1);
        top_module->eval();
    }

    tfp->close();
    tfp_uart->close();
    delete top_module;
    exit(0);
}
```

* The first part creates a `Top_module` object, and a `VerilatedVcdC` object for each interface
* The second part enables `tfp` and `tfp_uart` to dump all signals into VCD files
* The third part sets the initial state of the modules to their default values
* The last part executes the simulation, and closes the files

# Examples

* [01.verilator](01.verilator)
  * Generate Verilog
  * Run Verilator

# References

* [Verilator](https://verilator.org/)
# [01] Verilator

The C++ RTL simulator, [Verilator](https://verilator.org/), supports a variety of synthesizable languages. Verilator is included with Vivado, so as long as the synthesis tool can generate the VHDL/SystemVerilog code, Verilator can be used.

# Requirements

Verilator 4.101+ is used in the course.

# Installation

* Install [Verilator](https://verilator.org/download/)
* Install [Vivado](https://www.xilinx.com/products/design-tools/vivado.html)
  * Vivado 2018.3 (you can download the free evaluation version here for personal use)
  * Be sure to select the option to install the Vivado Design Suite
* Create a new workspace in Vivado
  * Select 'File' -> 'Open' -> 'Select Workspace Directory'
  * Navigate to the workspace folder, or create a new one
  * Close the project window (`Ctrl+W`)

# Usage

## Generate Verilog

* Open Vivado
* In the toolbar, select 'File' -> 'Open Project'
  * Navigate to the workspace folder, or create a new one
* In the projects window, select 'Project', then 'Generate Block Design'
  * Select the 'RTL Source Files' tab
  * Select 'Add File...'
  * Select the top level file, for example `Top_module.v`
  * Click the 'Generate' button
* In the projects window, select 'Project', then 'Generate RTL Design'
  * Check the boxes for the required IPs (for example, `altera_primitives`)
  * Click the 'Generate' button
* In the projects window, select 'Project', then 'Rebuild Target'
  * Check the boxes for the required IPs (for example, `altera_primitives`)
  * Click the 'Rebuild' button
  * Select 'Generate Output Files'
  * Select 'RTL File', 'SystemVerilog Interface File', 'SystemVerilog Module File'
    * File names and path can be modified, but be sure to place these files in the proper places

## Running Verilator

* Run the following command from the project directory

```bash
verilator --trace -CFLAGS -g --top-module top_module --cc Top_module.cpp --exe --sv --sv-intf UartIF --exe Top_module.cpp
```

* The Verilator executable is named `Vtop_module`
* In the same directory, open the `out_dir/Vtop_module.cpp` file in a text editor
* You will see code that looks like this:

```cpp
int main(int argc, char** argv, char** env) {
    Verilated::commandArgs(argc, argv);
    Verilated::traceEverOn(true);
    Top_module* top_module = new Top_module;
    top_module->uart_interface->uart_tx = 0;
    top_module->uart_interface->uart_rx = 0;
    top_module->uart_interface->rstb = 0;
    top_module->uart_interface->clk = 0;


    top_module->uart_interface->rstb = 1;
    top_module->uart_interface->clk = 1;
    top_module->uart_interface->rstb = 1;
    top_module->uart_interface->clk = 0;
    top_module->uart_interface->rstb = 1;
    top_module->uart