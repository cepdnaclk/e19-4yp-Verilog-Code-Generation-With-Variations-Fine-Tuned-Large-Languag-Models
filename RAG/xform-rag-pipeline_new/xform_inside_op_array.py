#!/usr/bin/env python3
"""
Transformation to create test cases for using an array as a whole in the inside operator.
This follows the pattern of the existing framework, using PyVerilog AST for analysis
and regex for the actual transformations.
"""

import sys
import os
import re
import argparse
from pyverilog.vparser.parser import parse
from pyverilog.vparser.ast import *


class ArrayAsWholeVisitor:
    """
    AST visitor that identifies signals to transform for "array as a whole" test cases.
    """

    def __init__(self, signal_name, test_type="array_as_whole"):
        """
        Initialize the visitor.

        Args:
            signal_name (str): Name of the signal to modify
            test_type (str): Type of test case to generate
        """
        self.signal_name = signal_name
        self.test_type = test_type
        self.changes_made = []
        self.signal_found = False
        self.signal_type = None  # 'reg', 'wire', 'logic', etc.
        self.original_width = None
        self.original_array_dim = None
        self.test_signal_name = f"{signal_name}_test"

    def visit(self, node):
        """Visit a node and identify signals to transform."""
        if isinstance(node, Node):
            # Check for array declarations
            if isinstance(node, Decl):
                for item in node.list:
                    if hasattr(item, "name") and item.name == self.signal_name:
                        # Found the signal
                        self.signal_found = True

                        # Determine signal type
                        self.signal_type = type(item).__name__.lower()

                        # Store original width if it exists
                        if hasattr(item, "width") and item.width:
                            if isinstance(item.width, Width):
                                msb = item.width.msb
                                lsb = item.width.lsb
                                if hasattr(msb, "value") and hasattr(lsb, "value"):
                                    self.original_width = "[%s:%s]" % (
                                        msb.value,
                                        lsb.value,
                                    )

                        # Store original array dimensions if they exist
                        if hasattr(item, "length") and item.length:
                            if isinstance(item.length, Length):
                                msb = item.length.msb
                                lsb = item.length.lsb
                                if hasattr(msb, "value") and hasattr(lsb, "value"):
                                    self.original_array_dim = "[%s:%s]" % (
                                        msb.value,
                                        lsb.value,
                                    )

                        self.changes_made.append(
                            "Added test case for '%s' to use array as a whole in inside operator"
                            % (self.signal_name)
                        )

            # Visit children
            for c in node.children():
                self.visit(c)


def transform_array_inside_op(
    input_file, output_file, signal_name, test_type="array_as_whole"
):
    """
    Transform a file to add test cases for using arrays in inside operator.

    Args:
        input_file (str): Path to input Verilog file
        output_file (str): Path to output Verilog file
        signal_name (str): Name of the signal to use in the test case
        test_type (str): Type of test case to generate (array_as_whole, array_slice, etc.)

    Returns:
        bool: True if successful, False otherwise
    """
    try:
        # Read the input file
        with open(input_file, "r") as f:
            content = f.read()

        # Parse the Verilog file to get the AST
        ast, directives = parse([input_file])

        # Create and apply the visitor
        visitor = ArrayAsWholeVisitor(signal_name, test_type)
        visitor.visit(ast)

        # Check if the signal was found
        if not visitor.signal_found:
            print("Warning: Signal '%s' not found" % signal_name)
            return False

        # Print summary of changes
        for change in visitor.changes_made:
            print(change)

        # Get the extracted information from the visitor
        signal_type = visitor.signal_type
        original_width = visitor.original_width or ""
        original_array_dim = visitor.original_array_dim or ""
        test_signal_name = visitor.test_signal_name

        # Find the module definition end (before endmodule) to add our test code
        module_end_match = re.search(r"((?:\n|.)*?)(\s*endmodule)", content)
        if not module_end_match:
            print("Warning: Could not find module end")
            return False

        module_content = module_end_match.group(1)
        module_end = module_end_match.group(2)

        # Create test logic based on test_type
        test_logic = ""

        if test_type == "array_as_whole":
            # Test using the whole array in inside operator
            test_logic = f"""
  // Test case for array as a whole in inside operator
  wire test_result;
  
  // Define array to test against
  {signal_type} {original_width} test_array{original_array_dim};
  
  // Example test condition: check if the array is inside the test array
  assign test_result = ({signal_name} inside {{test_array}});
"""
        elif test_type == "array_slice":
            # Test using array slice in inside operator
            test_logic = f"""
  // Test case for array slice in inside operator
  wire test_result;
  
  // Example test condition: check if part of the array is inside the range
  assign test_result = ({signal_name}[2:0] inside {{3'b101, 3'b111}});
"""
        elif test_type == "part_select":
            # Test using part select in inside operator
            test_logic = f"""
  // Test case for part select in inside operator
  wire test_result;
  
  // Example test condition: check if the part select is inside the range
  assign test_result = ({signal_name}[3] inside {{1'b0, 1'b1}});
"""
        elif test_type == "array_select_mda":
            # Test using array select for MDA
            test_logic = f"""
  // Test case for array select for MDA in inside operator
  wire test_result;
  
  // Example test condition: check if the selected array element is inside the range
  assign test_result = ({signal_name}[2] inside {{8'h00, 8'hFF}});
"""
        elif test_type == "constant_var_index":
            # Test using constant or variable index
            test_logic = f"""
  // Test case for constant or variable index in inside operator
  wire test_result;
  reg [3:0] idx;
  
  // Example test condition: check if the array element at variable index is inside the range
  assign test_result = ({signal_name}[idx] inside {{8'h00, 8'hFF}});
"""
        elif test_type == "xmr_index":
            # Test using cross-module reference in array index
            test_logic = f"""
  // Test case for XMR in array index with inside operator
  wire test_result;
  
  // Example test condition: check if array element accessed via XMR is inside the range
  assign test_result = ({signal_name}[top.other_module.some_value] inside {{8'h00, 8'hFF}});
"""
        elif test_type == "function_call_index":
            # Test using function call in array index
            test_logic = f"""
  // Test case for function call in array index with inside operator
  wire test_result;
  
  // Example function to calculate an index
  function [3:0] get_index;
    input [3:0] base;
    begin
      get_index = base + 4'd2;
    end
  endfunction
  
  // Example test condition: check if array element accessed via function call is inside the range
  assign test_result = ({signal_name}[get_index(4'd1)] inside {{8'h00, 8'hFF}});
"""
        else:
            # Default test case
            test_logic = f"""
  // Test case for array in inside operator
  wire test_result;
  
  // Example test condition: check if the array is inside the range
  assign test_result = ({signal_name} inside {{8'h00, 8'hFF}});
"""

        # Add the test logic before endmodule
        modified_content = module_content + test_logic + module_end

        # Write the modified content to the output file
        with open(output_file, "w") as f:
            f.write(modified_content)

        print("Output written to %s" % output_file)
        return True

    except Exception as e:
        print("Error processing file: %s" % e)
        import traceback

        traceback.print_exc()
        return False


def main():
    """Main function to parse command line arguments and process the file."""
    parser = argparse.ArgumentParser(
        description="Transform a file to add test cases for using arrays in inside operator"
    )
    parser.add_argument("input_file", help="Input Verilog file")
    parser.add_argument("output_file", help="Output Verilog file")
    parser.add_argument(
        "--signal", required=True, help="Name of the signal to use in the test case"
    )
    parser.add_argument(
        "--test-type",
        choices=[
            "array_as_whole",
            "array_slice",
            "part_select",
            "array_select_mda",
            "constant_var_index",
            "xmr_index",
            "function_call_index",
        ],
        default="array_as_whole",
        help="Type of test case to generate",
    )

    args = parser.parse_args()

    # Ensure input file exists
    if not os.path.exists(args.input_file):
        print("Error: Input file '%s' not found" % args.input_file)
        return 1

    # Process the file
    success = transform_array_inside_op(
        args.input_file, args.output_file, args.signal, args.test_type
    )

    return 0 if success else 1


if __name__ == "__main__":
    sys.exit(main())
