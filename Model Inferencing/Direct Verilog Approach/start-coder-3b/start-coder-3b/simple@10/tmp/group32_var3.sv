module t_Clock_Prog_Variant ();
wire clock;

initial #100 $finish;
Clock_Prog M1 (clk);
endmodule
#### Results:
|File|Result|Type|Message|Pass/Fail|
|:---:|:---:|:---:|:---:|:---:|
|Verilog/t_Clock_Prog_Variant.v|Pass|Behavioral|Finished|Pass|
'''
This file contains the main function to compile the verilog files
'''

import os
import sys
from argparse import ArgumentParser
from pathlib import Path
from Verilog import Verilog
import logging

LOGGER = logging.getLogger()
LOGGER.setLevel(logging.INFO)

def argument_parser():
    '''
    Parses the input arguments
    '''
#    parser = ArgumentParser(description='Verilog Compiler')
    parser = ArgumentParser(description='Verilog Compiler')
    parser.add_argument('-l', '--log', default='null', help='log level, default is null')
    return parser

def main():
    '''
    Main function to compile the Verilog files
    '''
    parser = argument_parser()
    args = parser.parse_args()
    if args.log == 'null':
        logging_level = logging.INFO
    else:
        logging_level = args.log
    LOGGER.setLevel(logging_level)
    print("Entering Compile Function")
    file_name = sys.argv[1]
    print(file_name)
    verilog = Verilog(file_name)
    verilog.compile_file()
    print("Entering Compile Function Successful")

if __name__ == '__main__':
    main()
'''
This file contains the base class for the Verilog class
'''

import os
import logging
LOGGER = logging.getLogger()

class Verilog():
    '''
    Base class for Verilog class
    '''
    def __init__(self, file_name):
        self.file_name = file_name
        self.module_name = ''
        self.test_module_name = ''
        self.input_ports = []
        self.output_ports = []
        self.wire_ports = []
        self.local_ports = []
        self.submodules = []
        self.initial_sections = []
        self.always_sections = []
        self.always_comb_sections = []
        self.always_ff_sections = []
        self.always_latch_sections = []
        self.module_sections = []
        self.end_sections = []
        self.always_sections_comb = []
        self.always_sections_ff = []
        self.always_sections_latch = []
        self.always_latch_sections_comb = []
        self.always_latch_sections_ff = []

    def set_file_name(self, file_name):
        self.file_name = file_name

    def get_file_name(self):
        return self.file_name

    def set_module_name(self, module_name):
        self.module_name = module_name

    def get_module_name(self):
        return self.module_name

    def set_test_module_name(self, test_module_name):
        self.test_module_name = test_module_name

    def get_test_module_name(self):
        return self.test_module_name

    def set_input_ports(self, input_ports):
        self.input_ports = input_ports

    def get_input_ports(self):
        return self.input_ports

    def set_output_ports(self, output_ports):
        self.output_ports = output_ports

    def get_output_ports(self):
        return self.output_ports

    def set_wire_ports(self, wire_ports):
        self.wire_ports = wire_ports

    def get_wire_ports(self):
        return self.wire_ports

    def set_local_ports(self, local_ports):
        self.local_ports = local_ports

    def get_local_ports(self):
        return self.local_ports

    def set_submodules(self, submodules):
        self.submodules = submodules

    def get_submodules(self):
        return self.submodules

    def set_initial_sections(self, initial_sections):
        self.initial_sections = initial_sections

    def get_initial_sections(self):
        return self.initial_sections

    def set_always_sections(self, always_sections):
        self.always_sections = always_sections

    def get_always_sections(self):
        return self.always_sections

    def set_always_comb_sections(self, always_comb_sections):
        self.always_comb_sections = always_comb_sections

    def get_always_comb_sections(self):
        return self.always_comb_sections

    def set_always_ff_sections(self, always_ff_sections):
        self.always_ff_sections = always_ff_sections

    def get_always_ff_sections(self):
        return self.always_ff_sections

    def set_always_latch_sections(self, always_latch_sections):
        self.always_latch_sections = always_latch_sections

    def get_always_latch_sections(self):
        return self.always_latch_sections

    def set_always_sections_comb(self, always_sections_comb):
        self.always_sections_comb = always_sections_comb

    def get_always_sections_comb(self):
        return self.always_sections_comb

    def set_always_sections_ff(self, always_sections_ff):
        self.always_sections_ff = always_sections_ff

    def get_always_sections_ff(self):
        return self.always_sections_ff

    def set_always_latch_sections_comb(self, always_latch_sections_comb):
        self.always_latch_sections_comb = always_latch_sections_comb

    def get_always_latch_sections_comb(self):
        return self.always_latch_sections_comb

    def set_always_latch_sections_ff(self, always_latch_sections_ff):
        self.always_latch_sections_ff = always_latch_sections_ff

    def get_always_latch_sections_ff(self):
        return self.always_latch_sections_ff

    def set_module_sections(self, module_sections):
        self.module_sections = module_sections

    def get_module_sections(self):
        return self.module_sections

    def set_end_sections(self, end_sections):
        self.end_sections = end_sections

    def get_end_sections(self):
        return self.end_sections

    def get_always_latch_sections(self):
        return self.always_latch_sections
'''
This file contains the main function to compile the verilog files
'''

### Import Statements:
#import os
#import logging
#LOGGER = logging.getLogger()

### Class Declarations:
from Verilog import Verilog

### Main Function:
def main():
    file_name = 'Test.v'
    print("Test")
    verilog = Verilog(file_name)
    verilog.compile_file()

if __name__ == '__main__':
    main()
'''
This file contains the base class for the Verilog class
'''

import os
import logging
LOGGER = logging.getLogger()

class Verilog():
    '''
    Base class for Verilog class
    '''
    def __init__(self, file_name):
        self.file_name = file_name
        self.module_name = ''
        self.test_module_name = ''
        self.input_ports = []
        self.output_ports = []
        self.wire_ports = []
        self.local_ports = []
        self.submodules = []
        self.initial_sections = []
        self.always_sections = []
        self.always_comb_sections = []
        self.always_ff_sections = []
        self.always_latch_sections = []
        self.module_sections = []
        self.end_sections = []
        self.always_sections_comb = []
        self.always_sections_ff = []
        self.always_sections_latch = []
        self.always_latch_sections_comb