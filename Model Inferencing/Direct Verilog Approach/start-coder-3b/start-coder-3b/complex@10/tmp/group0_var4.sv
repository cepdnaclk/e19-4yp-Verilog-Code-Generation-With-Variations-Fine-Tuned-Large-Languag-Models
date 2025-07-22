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
initial $monitor("t=%0d, en = %b, a = %h, b = %b",$time,en,a,b); // Use %h for hex 'a'
initial $stop; // Stop simulation
endmodule
### Result:
```
<br>

<img src="./images/Test 34, 35.jpg">

<br>

# Conclusion

All tests are passed without error.

<br>

*This repository is written by  and  as the project for FRM/ENEE1550, Fall 2020, at Northeastern University.*
/source_code/tst_and_gate.c
/*
 * File name: and_gate.c
 * Author:, 
 * Date: 10/25/2020
 * Version: 1.0
 */

#include <vpi_user.h>
#include <stdio.h>
#include "or_gate.h"

/*
 * and_gate()
 *
 * Description:
 *      This is the function for the AND gate.
 */

static void
and_gate(char *user_data)
{
    vpiHandle arg_handle, p_handle, f_handle, sig_handle;

    char* p_str = "p";
    char* f_str = "f";
    char* sig_str = "sig";

    arg_handle = vpi_iterate(vpiArgument, vpi_handle(user_data));
    p_handle = vpi_handle(vpizaxxer(vpi_handle(arg_handle), p_str));
    f_handle = vpi_handle(vpizaxxer(vpi_handle(arg_handle), f_str));
    sig_handle = vpi_handle(vpizaxxer(vpi_handle(arg_handle), sig_str));

    vpi_printf("p is %b\n", vpi_get_str(p_handle));
    vpi_printf("f is %b\n", vpi_get_str(f_handle));
    vpi_printf("sig is %b\n", vpi_get_str(sig_handle));
}

/*
 * or_gate_register()
 *
 * Description:
 *      This is the registration function for the OR gate.
 */

void
or_gate_register()
{
    s_vpi_systf_data tf_data;

    tf_data.type = vpiSysFunc;
    tf_data.tfname = "$and_gate";
    tf_data.calltf = and_gate;
    tf_data.compiletf = NULL;
    tf_data.sizetf = NULL;
    tf_data.user_data = NULL;

    vpi_register_systf(&tf_data);
}

/*
 * Entry Point
 *
 * Description:
 *      This is the entry point for the OR gate.
 */

int
vlog_startup(int argc, char* argv[])
{
    or_gate_register();
    return 0;
}/source_code/test_suite/run_test.py
import os
import pathlib
import subprocess

# Define a function to run a given test
def run_test(test_name):
    # Define a list of the input files to the vhdl simulator
    input_files = [
        'or_gate_tb.vhd',
        'and_gate_tb.vhd',
        'xor_gate_tb.vhd',
        'not_gate_tb.vhd',
        'nor_gate_tb.vhd',
        'nand_gate_tb.vhd',
        'xnor_gate_tb.vhd',
        'full_adder_tb.vhd',
        'half_subtractor_tb.vhd',
        'full_subtractor_tb.vhd',
       'multiplier_tb.vhd',
        'divider_tb.vhd',
       'shifter_tb.vhd',
        'decoder_tb.vhd',
        'counter_tb.vhd'
    ]

    # Define a list of the output files from the vhdl simulator
    output_files = [
        'or_gate_tb.vcd',
        'and_gate_tb.vcd',
        'xor_gate_tb.vcd',
        'not_gate_tb.vcd',
        'nor_gate_tb.vcd',
        'nand_gate_tb.vcd',
        'xnor_gate_tb.vcd',
        'full_adder_tb.vcd',
        'half_subtractor_tb.vcd',
        'full_subtractor_tb.vcd',
       'multiplier_tb.vcd',
        'divider_tb.vcd',
       'shifter_tb.vcd',
        'decoder_tb.vcd',
        'counter_tb.vcd'
    ]

    # Define the output folder to be generated
    output_folder_name = "outputs"
    output_folder = os.path.join(repo_folder, output_folder_name)

    # Make the output folder if it does not exist
    if not os.path.exists(output_folder):
        os.makedirs(output_folder)

    # Define the base folder of the test to be run
    test_folder = os.path.join(repo_folder, test_name)

    # Define the file to be run
    test_file = os.path.join(test_folder, test_name + '.vhd')

    # Define the simulator name
    simulator = 'ghdl'

    # Define the simulator flags
    simulator_flags = [
        '-e',
       'main',
        '--ieee=synopsys',
        '-P',
        os.path.join(repo_folder,'source_code'),
        '-P',
        os.path.join(repo_folder,'source_code', 'test_suite'),
        '--top-module',
        test_name + '_tb',
        '--work',
        test_name
    ]

    # Define the simulator output file
    sim_out = os.path.join(repo_folder, output_folder, test_name + '.out')

    # Define the simulator log file
    sim_log = os.path.join(repo_folder, output_folder, test_name + '.log')

    # Define the simulator coverage file
    sim_cov = os.path.join(repo_folder, output_folder, test_name + '.coverage')

    # Define the simulator coverage flag
    sim_cov_flag = '--vcd-timescale=1us'

    # Define the simulator coverage flags
    sim_cov_flags = [
        '-l',
        '-v',
        '--coverage'
    ]

    # Define the simulator coverage flag
    sim_cov_flag_coverage = '--coverage-file='

    # Define the simulator coverage flag
    sim_cov_flag_instr = '--coverage-instruction'

    # Define the testbench source file
    test_source_file = os.path.join(test_folder, test_name + '_tb.vhd')

    # Define the testbench input files
    test_source_files = []

    # Loop over input files
    for entry in input_files