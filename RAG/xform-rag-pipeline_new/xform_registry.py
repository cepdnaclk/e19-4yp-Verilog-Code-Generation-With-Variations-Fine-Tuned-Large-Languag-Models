#!/usr/bin/env python3
"""
Registry for all available transformations.
"""

import sys
import os
import argparse

# Import the transformation functions directly
# Assuming the files are in the current directory, not in a package
from xform_inside_op_debug import transform_inside_op_debug
from xform_inside_op_misc import transform_inside_op_misc
from xform_inside_op_negative import transform_inside_op_negative
from xform_inside_op_xmr import transform_inside_op_xmr
from xform_inside_op_array import transform_array_inside_op
from xform_inside_op_context import transform_inside_op_context
from xform_inside_op_scope import transform_inside_op_scope
from xform_array_base_type import transform_array_base_type
from xform_associative_mda_key_type import transform_associative_mda_key_type
from xform_reg_to_wire import transform_reg_to_wire
from xform_module_name import transform_module_name
from xform_rename_port import transform_rename_port
from xform_change_reset_condition import transform_reset_condition
from xform_change_signal_width import transform_signal_width
from xform_add_enable_signal import transform_add_enable

# Import the MDA transformations
from xform_range_mda import transform_fixed_range_mda
from xform_dynamic_mda import transform_dynamic_mda
from xform_queue_mda import transform_queue_mda
from xform_associative_mda import transform_associative_mda
from xform_mixed_mda import transform_mixed_mda
from xform_structure_type import transform_structure_type

# Dictionary of all available transformations
AVAILABLE_XFORMS = {
    "reg_to_wire": {
        "description": "Change reg variables to wire",
        "function": transform_reg_to_wire,
        "args": {
            "target_variable": {
                "help": "Specific variable to transform (default: all reg variables)",
                "required": False,
                "arg_name": "variable",
            }
        },
    },
    "module_name": {
        "description": "Change module name",
        "function": transform_module_name,
        "args": {
            "from_name": {
                "help": "Original module name",
                "required": True,
                "arg_name": "from",
            },
            "to_name": {
                "help": "New module name",
                "required": True,
                "arg_name": "to",
            },
        },
    },
    "port_rename": {
        "description": "Rename ports in a module",
        "function": transform_rename_port,
        "args": {
            "from_name": {
                "help": "Original port name",
                "required": True,
                "arg_name": "from",
            },
            "to_name": {
                "help": "New port name",
                "required": True,
                "arg_name": "to",
            },
        },
    },
    "reset_condition": {
        "description": "Transform reset condition from active-high to active-low or vice versa",
        "function": transform_reset_condition,
        "args": {
            "reset_signal": {
                "help": "Name of the reset signal",
                "required": True,
                "arg_name": "signal",
            },
            "active_high_to_low": {
                "help": "Direction of change: high_to_low or low_to_high",
                "required": False,
                "arg_name": "direction",
            },
        },
    },
    "signal_width": {
        "description": "Change a signal's width in a Verilog module",
        "function": transform_signal_width,
        "args": {
            "signal_name": {
                "help": "Name of the signal to modify",
                "required": True,
                "arg_name": "signal",
            },
            "new_width": {
                "help": "New width in the format 'msb:lsb' (e.g., '3:0')",
                "required": True,
                "arg_name": "width",
            },
        },
    },
    "add_enable": {
        "description": "Add an enable signal to a counter in a Verilog module",
        "function": transform_add_enable,
        "args": {
            "enable_name": {
                "help": "Name of the enable signal to add",
                "required": True,
                "arg_name": "enable",
            },
            "counter_name": {
                "help": "Name of the counter to control",
                "required": True,
                "arg_name": "counter",
            },
        },
    },
    # MDA transformations
    "fixed_range_mda": {
        "description": "Transform a signal to use fixed-range multi-dimensional arrays",
        "function": transform_fixed_range_mda,
        "args": {
            "signal_name": {
                "help": "Name of the signal to modify",
                "required": True,
                "arg_name": "signal",
            },
            "ranges": {
                "help": "List of ranges for dimensions (e.g., 7:0 3:0 15:0)",
                "required": True,
                "arg_name": "ranges",
                "nargs": "+",  # Accept multiple args
            },
        },
    },
    "dynamic_mda": {
        "description": "Transform a signal to use dynamic multi-dimensional arrays",
        "function": transform_dynamic_mda,
        "args": {
            "signal_name": {
                "help": "Name of the signal to modify",
                "required": True,
                "arg_name": "signal",
            },
            "dimensions": {
                "help": "Number of dimensions for the dynamic MDA (default: 2)",
                "required": True,
                "arg_name": "dimensions",
                "type": int,
                "default": 2,
            },
        },
    },
    "queue_mda": {
        "description": "Transform a signal to use queue-based multi-dimensional arrays",
        "function": transform_queue_mda,
        "args": {
            "signal_name": {
                "help": "Name of the signal to modify",
                "required": True,
                "arg_name": "signal",
            },
            "dimensions": {
                "help": "Number of dimensions for the queue MDA (default: 1)",
                "required": True,
                "arg_name": "dimensions",
                "type": int,
                "default": 1,
            },
            "bounded": {
                "help": "Create a bounded queue",
                "required": False,
                "arg_name": "bounded",
                "action": "store_true",
            },
            "bound_size": {
                "help": "Size limit for bounded queue",
                "required": False,
                "arg_name": "bound-size",
                "type": int,
            },
        },
    },
    "associative_mda": {
        "description": "Transform a signal to use associative array multi-dimensional arrays",
        "function": transform_associative_mda,
        "args": {
            "signal_name": {
                "help": "Name of the signal to modify",
                "required": True,
                "arg_name": "signal",
            },
            "key_type": {
                "help": "Type of key for associative array",
                "required": True,
                "arg_name": "key-type",
                "choices": ["string", "int", "vector", "class", "wildcard"],
            },
            "dimensions": {
                "help": "Number of associative array dimensions (default: 1)",
                "required": False,
                "arg_name": "dimensions",
                "type": int,
                "default": 1,
            },
        },
    },
    "mixed_mda": {
        "description": "Transform a signal to use mixed multi-dimensional arrays",
        "function": transform_mixed_mda,
        "args": {
            "signal_name": {
                "help": "Name of the signal to modify",
                "required": True,
                "arg_name": "signal",
            },
            "mda_spec": {
                "help": "MDA dimension specs (e.g., fixed:7:0 assoc:string queue)",
                "required": True,
                "arg_name": "mda-spec",
                "nargs": "+",  # Accept multiple args
            },
        },
    },
    "associative_mda_key_type": {
        "description": "Transform a signal to use associative array with specific key types",
        "function": transform_associative_mda_key_type,
        "args": {
            "signal_name": {
                "help": "Name of the signal to modify",
                "required": True,
                "arg_name": "signal",
            },
            "key_type": {
                "help": "Type of key for associative array",
                "required": True,
                "arg_name": "key-type",
                "choices": [
                    "int",
                    "integer",
                    "longint",
                    "shortint",
                    "bit",
                    "logic",
                    "bit-vector",
                    "logic-vector",
                    "reg",
                    "byte",
                    "string",
                    "class",
                    "enum",
                    "union",
                    "struct",
                    "wildcard",
                ],
            },
        },
    },
    "array_base_type": {
        "description": "Transform a signal to use a specific base type",
        "function": transform_array_base_type,
        "args": {
            "signal_name": {
                "help": "Name of the signal to modify",
                "required": True,
                "arg_name": "signal",
            },
            "base_type": {
                "help": "Base type for the array",
                "required": True,
                "arg_name": "base-type",
                "choices": [
                    "int",
                    "integer",
                    "longint",
                    "shortint",
                    "bit",
                    "logic",
                    "reg",
                    "byte",
                    "string",
                    "enum",
                    "struct",
                    "union",
                ],
            },
        },
    },
    "structure_type": {
        "description": "Transform a signal to use a specific structure type",
        "function": transform_structure_type,
        "args": {
            "signal_name": {
                "help": "Name of the signal to modify",
                "required": True,
                "arg_name": "signal",
            },
            "struct_type": {
                "help": "Type of structure to use",
                "required": True,
                "arg_name": "struct-type",
                "choices": [
                    "packed",
                    "unpacked",
                    "nested",
                    "hybrid",
                    "union",
                    "blasted",
                    "native",
                    "extended_class",
                    "rand_members",
                ],
            },
        },
    },
    "inside_op_array": {
        "description": "Add test case for using arrays in inside operator",
        "function": transform_array_inside_op,
        "args": {
            "signal_name": {
                "help": "Name of the signal to use in the test case",
                "required": True,
                "arg_name": "signal",
            },
            "test_type": {
                "help": "Type of test case to generate",
                "required": False,
                "arg_name": "test-type",
                "choices": [
                    "array_as_whole",
                    "array_slice",
                    "part_select",
                    "array_select_mda",
                    "constant_var_index",
                    "xmr_index",
                    "function_call_index",
                ],
                "default": "array_as_whole",
            },
        },
    },
    "inside_op_context": {
        "description": "Add test case for inside operator in different contexts",
        "function": transform_inside_op_context,
        "args": {
            "signal_name": {
                "help": "Name of the signal to use in the test case",
                "required": True,
                "arg_name": "signal",
            },
            "context_type": {
                "help": "Type of context to test",
                "required": True,
                "arg_name": "context",
                "choices": [
                    "if_statement",
                    "case",
                    "loop",
                    "continuous_assign",
                    "procedural_continuous_assign",
                    "procedural_assign_initial_final",
                    "variable_initialization",
                    "always_comb",
                    "initial_final_blocks",
                    "module_highconn",
                    "case_inside",
                ],
            },
        },
    },
    "inside_op_scope": {
        "description": "Add test case for inside operator in different scopes",
        "function": transform_inside_op_scope,
        "args": {
            "signal_name": {
                "help": "Name of the signal to use in the test case",
                "required": True,
                "arg_name": "signal",
            },
            "scope_type": {
                "help": "Type of scope to test",
                "required": True,
                "arg_name": "scope",
                "choices": [
                    "module",
                    "interface",
                    "package",
                    "sv_class",
                    "dollar_unit",
                    "generate_block",
                ],
            },
        },
    },
    "inside_op_xmr": {
        "description": "Add test case for XMR with inside operator",
        "function": transform_inside_op_xmr,
        "args": {
            "signal_name": {
                "help": "Name of the signal to use in the test case",
                "required": True,
                "arg_name": "signal",
            },
            "xmr_type": {
                "help": "Type of XMR to test",
                "required": True,
                "arg_name": "xmr-type",
                "choices": [
                    "module_xmr",
                    "interface_xmr",
                    "class_xmr",
                    "virtual_interface_xmr",
                    "structure_xmr",
                    "package_xmr",
                    "mix_xmr",
                ],
            },
        },
    },
    "inside_op_negative": {
        "description": "Add negative test cases for inside operator",
        "function": transform_inside_op_negative,
        "args": {
            "signal_name": {
                "help": "Name of the signal to use in the test case",
                "required": True,
                "arg_name": "signal",
            },
            "test_type": {
                "help": "Type of negative test to perform",
                "required": True,
                "arg_name": "test-type",
                "choices": ["out_of_index", "wildcard_index"],
            },
        },
    },
    "inside_op_misc": {
        "description": "Add miscellaneous/edge case test cases for inside operator",
        "function": transform_inside_op_misc,
        "args": {
            "signal_name": {
                "help": "Name of the signal to use in the test case",
                "required": True,
                "arg_name": "signal",
            },
            "misc_type": {
                "help": "Type of miscellaneous test to perform",
                "required": True,
                "arg_name": "misc-type",
                "choices": [
                    "x_z_values",
                    "zero_select",
                    "comparison_result",
                    "unsized_literal",
                    "open_range_error",
                    "initial_block",
                    "empty_vsa",
                    "array_methods",
                    "generate_loop",
                    "case_expression",
                    "always_comb",
                    "array_method_clause",
                    "function_returning_vsa",
                    "while_loop_array_slice",
                    "upward_xmr_array",
                    "chained_function",
                    "dpi_function",
                    "stress_large_array",
                    "class_static_array",
                ],
            },
        },
    },
    "inside_op_debug": {
        "description": "Add debug and tool-specific test cases for inside operator",
        "function": transform_inside_op_debug,
        "args": {
            "signal_name": {
                "help": "Name of the signal to use in the test case",
                "required": True,
                "arg_name": "signal",
            },
            "debug_type": {
                "help": "Type of debug test to perform",
                "required": True,
                "arg_name": "debug-type",
                "choices": [
                    "value_annotation",
                    "trace_driver_load",
                    "scountdriver",
                    "shdl_xmr_force",
                    "ucli_trace",
                    "ucli_vpi_walkers",
                ],
            },
        },
    },
}


def list_xforms():
    """Print a list of all available transformations."""
    print("Available transformations:")
    for name, info in AVAILABLE_XFORMS.items():
        print(f"  {name}: {info['description']}")
        print("    Arguments:")
        for arg_name, arg_info in info["args"].items():
            required = "required" if arg_info.get("required", False) else "optional"
            cmd_arg = arg_info.get("arg_name", arg_name)
            print(f"      --{cmd_arg}: {arg_info['help']} ({required})")
        print()


def setup_parser():
    """Set up the argument parser with subcommands for each transformation."""
    parser = argparse.ArgumentParser(description="Run Verilog transformations")

    # Add common arguments
    parser.add_argument(
        "--list", action="store_true", help="List all available transformations"
    )

    # Add subparsers for each transformation
    subparsers = parser.add_subparsers(dest="xform", help="Transformation to apply")

    # Add a subparser for each transformation
    for xform_name, xform_info in AVAILABLE_XFORMS.items():
        subparser = subparsers.add_parser(xform_name, help=xform_info["description"])

        # Add input and output arguments to each subparser
        subparser.add_argument(
            "--input", "-i", required=True, help="Input Verilog file"
        )
        subparser.add_argument(
            "--output", "-o", required=True, help="Output Verilog file"
        )

        # Add transformation-specific arguments
        for param_name, param_info in xform_info["args"].items():
            cmd_arg = param_info.get("arg_name", param_name)
            required = param_info.get("required", False)

            # Basic argument properties
            arg_props = {
                "help": param_info["help"],
                "required": required,
                "dest": param_name,  # Use the internal parameter name as destination
            }

            # Add type if specified
            if "type" in param_info:
                arg_props["type"] = param_info["type"]

            # Add default if specified
            if "default" in param_info:
                arg_props["default"] = param_info["default"]

            # Add choices if specified
            if "choices" in param_info:
                arg_props["choices"] = param_info["choices"]

            # Add nargs if specified
            if "nargs" in param_info:
                arg_props["nargs"] = param_info["nargs"]

            # Handle store_true action
            if "action" in param_info and param_info["action"] == "store_true":
                arg_props["action"] = "store_true"

            # Add the argument to the parser
            subparser.add_argument(f"--{cmd_arg}", **arg_props)

    return parser


def run_xform(xform_name, args):
    """
    Run a transformation based on the name and arguments.

    Args:
        xform_name (str): Name of the transformation
        args (Namespace): Command-line arguments namespace

    Returns:
        bool: True if successful, False otherwise
    """
    if xform_name not in AVAILABLE_XFORMS:
        print(f"Error: Unknown transformation '{xform_name}'")
        return False

    xform_info = AVAILABLE_XFORMS[xform_name]
    xform_function = xform_info["function"]

    # Get input and output files
    input_file = args.input
    output_file = args.output

    # Ensure input file exists
    if not os.path.exists(input_file):
        print(f"Error: Input file '{input_file}' not found")
        return False

    # Create function arguments dictionary
    function_args = {}
    for param_name in xform_info["args"]:
        if hasattr(args, param_name) and getattr(args, param_name) is not None:
            value = getattr(args, param_name)

            # Special handling for specific transformations
            if (
                xform_name == "reset_condition"
                and param_name == "active_high_to_low"
                and value is not None
            ):
                # Convert string to boolean
                if value.lower() in ["high_to_low", "true", "1"]:
                    value = True
                else:
                    value = False

            function_args[param_name] = value

    # Call the transformation function
    try:
        print(f"Running transformation: {xform_name}")
        return xform_function(input_file, output_file, **function_args)
    except Exception as e:
        print(f"Error running transformation '{xform_name}': {e}")
        import traceback

        traceback.print_exc()
        return False


def main():
    """Main function to parse command line arguments and run transformations."""
    parser = setup_parser()
    args = parser.parse_args()

    # List available transformations
    if args.list:
        list_xforms()
        return 0

    # Check if a transformation was specified
    if not args.xform:
        parser.print_help()
        return 1

    # Run the transformation
    success = run_xform(args.xform, args)
    return 0 if success else 1


if __name__ == "__main__":
    sys.exit(main())
