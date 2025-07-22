module example1(Data, Clock, Reset, RegSum, Sum);
input Clock, Reset;
input [3:0] Data;
output [3:0] Sum, RegSum;
reg [3:0] Sum, RegSum;
reg4 R1 (Sum, Clock, Reset, RegSum);
assign RegSum = Sum;
assign Sum = Data + RegSum;
endmodule
```

## How to Use

To use the code generator provided, add the code generator from the command line via a path to the desired code generator.

```
./verilator_code_generator.py --code_generator_path=./path/to/verilator_code_generator.py
```

### Command Line Options
- *--code_generator_path*: (Required) Specifies the path to the code generator.
- *--generate_example_code*: (Optional) This flag generates the code generator example files.

### Example Usage

```
./verilator_code_generator.py --code_generator_path=./path/to/verilator_code_generator.py --generate_example_code=True
```

## Output

### Example Code

The code generator will generate a directory called "output" containing the following code generator files.

- *verilator_code_generator.py*: This is the code generator file.
- *example.v*: This is a Verilog example code file that uses the code generator.
- *example.sv*: This is a SystemVerilog example code file that uses the code generator.

## Known Issues

 - The code generator does not support the use of clock or reset registers in the code generator. If you have code that relies on these, you must modify the code before running the code generator.

 - The code generator does not support the use of other Verilog/SystemVerilog keywords. For example, if your code uses the keyword "for", you must modify the code before running the code generator.

 - The code generator does not support multiple output or input wires in one line. This means that the output wires must all be on the same line, and input wires must all be on the same line.

 - The code generator does not support the use of multiple signals in a signal declaration line. The signals must all be on the same line.

 - The code generator does not support the use of multiple output or input signals in one line. This means that the output signals must all be on the same line, and input signals must all be on the same line.

 - The code generator does not support multiple wires in a wire declaration line. The wires must all be on the same line.

 - The code generator does not support multiple registers in a register declaration line. The registers must all be on the same line.

 - The code generator does not support multiple instances of a register in the same line. The registers must all be on the same line.

 - The code generator does not support multiple instances of a module in the same line. The modules must all be on the same line.

 - The code generator does not support multiple instances of a module or module instantiation in the same line. The modules or instantiations must all be on the same line.

 - The code generator does not support the use of the wire keyword within an instantiation of another module or module instantiation. This means the wire keyword cannot be used inside module instantiations.

/verilator_code_generator.py
# -*- coding: utf-8 -*-
"""
@author: 
"""

import argparse
import os
import shutil


def main():
    parser = argparse.ArgumentParser(
        description="Verilator Code Generator"
    )
    parser.add_argument("--code_generator_path", help="Code Generator Path")
    parser.add_argument(
        "--generate_example_code",
        default=False,
        help="Generate Example Code",
        action='store_true'
    )
    args = parser.parse_args()

    code_generator_file_path = args.code_generator_path
    output_directory = "output"

    if args.generate_example_code:
        generate_example_code(code_generator_file_path, output_directory)
    if os.path.isfile(code_generator_file_path):
        print("Generating code...")
        generate_code(code_generator_file_path, output_directory)
    else:
        print("Code generator file path invalid.")


def generate_example_code(code_generator_file_path, output_directory):
    output_directory += os.sep
    example_file_path = output_directory + "example.v"
    example_sv_file_path = output_directory + "example.sv"
    if os.path.exists(output_directory):
        print("Directory already exists. Skipping.")
    else:
        os.mkdir(output_directory)
    with open(code_generator_file_path, "r") as f:
        code_generator_lines = f.readlines()
    with open(example_file_path, "w+") as f:
        write_file(f, example_file_path, code_generator_lines)
    with open(example_sv_file_path, "w+") as f:
        write_file(f, example_sv_file_path, code_generator_lines)
    print("Example code generated in {}".format(output_directory))


def generate_code(code_generator_file_path, output_directory):
    output_directory += os.sep
    register_file_path = output_directory + "register.v"
    register_sv_file_path = output_directory + "register.sv"
    counter_file_path = output_directory + "counter.v"
    counter_sv_file_path = output_directory + "counter.sv"
    counter8_file_path = output_directory + "counter8.v"
    counter8_sv_file_path = output_directory + "counter8.sv"
    shift_file_path = output_directory + "shift.v"
    shift_sv_file_path = output_directory + "shift.sv"
    if os.path.exists(output_directory):
        print("Directory already exists. Skipping.")
    else:
        os.mkdir(output_directory)
    with open(code_generator_file_path, "r") as f:
        code_generator_lines = f.readlines()
    #  Generate Register File
    with open(register_file_path, "w+") as f:
        write_file(f, register_file_path, code_generator_lines)
    #  Generate Register SV File
    with open(register_sv_file_path, "w+") as f:
        write_file(f, register_sv_file_path, code_generator_lines)
    #  Generate Counter File
    with open(counter_file_path, "w+") as f:
        write_file(f, counter_file_path, code_generator_lines)
    #  Generate Counter SV File
    with open(counter_sv_file_path, "w+") as f:
        write_file(f, counter_sv_file_path, code_generator_lines)
    #  Generate Counter8 File
    with open(counter8_file_path, "w+") as f:
        write_file(f, counter8_file_path, code_generator_lines)
    #  Generate Counter8 SV File
    with open(counter8_sv_file_path, "w+") as f:
        write_file(f, counter8_sv_file_path, code_generator_lines)
    #  Generate Shift File