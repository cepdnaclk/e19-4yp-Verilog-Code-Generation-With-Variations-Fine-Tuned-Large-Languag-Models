# Verilog Xforms

A framework for creating and applying transformations to Verilog code, using PyVerilog for parsing.

## Overview

This framework provides a robust approach to transforming Verilog code. It uses PyVerilog to parse and analyze the code's structure, then applies targeted transformations with reliable string manipulation.

## Features

- PyVerilog-based parsing for accurate code analysis
- Robust transformations using string manipulation
- Framework for creating additional transformations
- Central registry of available transformations
- Command-line interface for easy use

## Requirements

- Python 3.6 or later
- PyVerilog library (`pip install pyverilog`)

## Available Transformations

1. **reg_to_wire**: Change `reg` variables to `wire`
   - Options:
     - `--variable`: Specific variable to transform (optional, transforms all if not specified)

2. **module_name**: Change module name
   - Options:
     - `--from`: Original module name (required)
     - `--to`: New module name (required)

## Usage

### Using the Registry

List available transformations:
```bash
python xform_registry_fixed.py --list
```

Apply a transformation:
```bash
python xform_registry_fixed.py --input input.v --output output.v --xform reg_to_wire --variable counter
```

```bash
python xform_registry_fixed.py --input input.v --output output.v --xform module_name --from old_module --to new_module
```

### Using Individual Scripts

Each transformation has its own script that can be used directly:

```bash
python reg_to_wire_xform_fixed2.py input.v output.v --variable counter
```

```bash
python module_name_xform_fixed2.py input.v output.v --from old_module --to new_module
```

## How It Works

The framework uses a hybrid approach that combines the strengths of PyVerilog and string manipulation:

1. **AST Parsing**: PyVerilog parses the Verilog code into an Abstract Syntax Tree (AST)
2. **Element Identification**: The AST is traversed to identify elements to transform
3. **String Transformation**: The actual transformations are applied with string manipulation
4. **Output Generation**: The modified code is written to the output file

This approach provides both the accuracy of AST-based analysis and the reliability of direct string manipulation.

## Key Files

- `xform_registry_fixed.py`: Central registry of available transformations
- `reg_to_wire_xform_fixed2.py`: Implementation of the reg-to-wire transformation
- `module_name_xform_fixed2.py`: Implementation of the module name transformation
- `simple_counter.v`: Sample Verilog file for testing
- `test_registry.sh`: Script to test the registry and transformations

## Creating New Transformations

To add a new transformation:

1. Create a new Python file (e.g., `my_xform.py`) with a transformation function
2. Add your transformation to the `AVAILABLE_XFORMS` dictionary in `xform_registry_fixed.py`

Example of a transformation function:

```python
def transform_my_feature(input_file, output_file, param1, param2):
    """
    My custom transformation.
    
    Args:
        input_file (str): Path to input Verilog file
        output_file (str): Path to output Verilog file
        param1: Custom parameter
        param2: Another custom parameter
    
    Returns:
        bool: True if successful, False otherwise
    """
    # Implementation here
    return True
```

## License

MIT