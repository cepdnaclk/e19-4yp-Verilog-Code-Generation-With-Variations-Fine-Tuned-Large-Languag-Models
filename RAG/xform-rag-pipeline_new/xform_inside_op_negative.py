#!/usr/bin/env python3
"""
Transformation to create test cases for negative testing scenarios of the inside operator.
This includes error conditions and edge cases that should be tested.
"""

import sys
import os
import re
import argparse
from pyverilog.vparser.parser import parse
from pyverilog.vparser.ast import *


class InsideOpNegativeVisitor:
    """
    AST visitor that identifies modules to add inside operator negative test cases.
    """

    def __init__(self, signal_name, test_type):
        """
        Initialize the visitor.

        Args:
            signal_name (str): Name of the signal to use in the test case
            test_type (str): Type of negative test to perform
        """
        self.signal_name = signal_name
        self.test_type = test_type
        self.changes_made = []
        self.signal_found = False
        self.signal_type = None
        self.module_name = None

    def visit(self, node):
        """Visit a node and identify signals and modules to transform."""
        if isinstance(node, Node):
            # Get the module name
            if isinstance(node, ModuleDef):
                self.module_name = node.name

            # Check for the signal declaration
            if isinstance(node, Decl):
                for item in node.list:
                    if hasattr(item, "name") and item.name == self.signal_name:
                        self.signal_found = True
                        self.signal_type = type(item).__name__.lower()
                        self.changes_made.append(
                            "Added negative test case for inside operator: %s"
                            % (self.test_type)
                        )

            # Visit children
            for c in node.children():
                self.visit(c)


def transform_inside_op_negative(input_file, output_file, signal_name, test_type):
    """
    Transform a file to add negative test cases for inside operator.

    Args:
        input_file (str): Path to input Verilog file
        output_file (str): Path to output Verilog file
        signal_name (str): Name of the signal to use in the test case
        test_type (str): Type of negative test to perform

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
        visitor = InsideOpNegativeVisitor(signal_name, test_type)
        visitor.visit(ast)

        # Print summary of changes
        for change in visitor.changes_made:
            print(change)

        # Get the extracted information from the visitor
        module_name = visitor.module_name or "simple_array_example"

        # Find the module definition end (before endmodule) to add our test code
        module_end_match = re.search(r"((?:\n|.)*?)(\s*endmodule)", content)
        if not module_end_match:
            print("Warning: Could not find module end")
            return False

        module_content = module_end_match.group(1)
        module_end = module_end_match.group(2)

        # Based on the test_type, determine what negative test to add
        if test_type == "out_of_index":
            # Test out of index access inside set membership operator
            test_logic = f"""
  // Negative test case: out of index access inside set membership operator
  logic [7:0] test_array [0:15];
  logic [7:0] test_value;
  logic out_of_index_result;
  
  initial begin
    // Initialize test array
    for (int i = 0; i < 16; i++) begin
      test_array[i] = i * 2;
    end
    test_value = 8'd10;
  end
  
  // This should cause an out-of-bounds error or warning
  // Accessing index beyond array bounds in inside operator
  always @(*) begin
    // INTENTIONAL ERROR: Accessing index 20 when array is [0:15]
    // This tests how tools handle out-of-bounds access in inside operator
    out_of_index_result = (test_value inside {{test_array[20], test_array[25]}});
  end
"""

        elif test_type == "wildcard_index":
            # Test associative array with wildcard index
            test_logic = f"""
  // Negative test case: associative array with wildcard index
  logic [7:0] assoc_array [string];
  logic [7:0] test_value;
  logic wildcard_result;
  
  initial begin
    // Initialize associative array
    assoc_array["key1"] = 8'd10;
    assoc_array["key2"] = 8'd20;
    assoc_array["key3"] = 8'd30;
    test_value = 8'd15;
  end
  
  // This may cause issues with wildcard access in associative arrays
  always @(*) begin
    // POTENTIAL ERROR: Using wildcard with associative array in inside operator
    // Some tools may not support this syntax
    wildcard_result = (test_value inside {{assoc_array["*"]}});
  end
"""

        else:
            print(f"Warning: Test type '{test_type}' not recognized")
            return False

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
        description="Transform a file to add negative test cases for inside operator"
    )
    parser.add_argument("input_file", help="Input Verilog file")
    parser.add_argument("output_file", help="Output Verilog file")
    parser.add_argument(
        "--signal", required=True, help="Name of the signal to use in the test case"
    )
    parser.add_argument(
        "--test-type",
        required=True,
        choices=["out_of_index", "wildcard_index"],
        help="Type of negative test to perform",
    )

    args = parser.parse_args()

    # Ensure input file exists
    if not os.path.exists(args.input_file):
        print("Error: Input file '%s' not found" % args.input_file)
        return 1

    # Process the file
    success = transform_inside_op_negative(
        args.input_file, args.output_file, args.signal, args.test_type
    )

    return 0 if success else 1


if __name__ == "__main__":
    sys.exit(main())
