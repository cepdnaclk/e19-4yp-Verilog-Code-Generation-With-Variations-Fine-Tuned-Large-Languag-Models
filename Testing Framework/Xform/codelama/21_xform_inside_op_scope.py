#!/usr/bin/env python3
"""
Transformation to create test cases for using the inside operator in different scopes.
This follows the pattern of the existing framework, using PyVerilog AST for analysis
and regex for the actual transformations.
"""

import sys
import os
import re
import argparse
from pyverilog.vparser.parser import parse
from pyverilog.vparser.ast import *

class InsideOpScopeVisitor:
    """
    AST visitor that identifies modules to add inside operator scope test cases.
    """

    def __init__(self, signal_name, scope_type):
        """
        Initialize the visitor.

        Args:
            signal_name (str): Name of the signal to use in the test case
            scope_type (str): Type of scope to test (module, interface, etc.)
        """
        self.signal_name = signal_name
        self.scope_type = scope_type
        self.changes_made = []
        self.signal_found = False
        self.signal_type = None  # 'reg', 'wire', 'logic', etc.
        self.original_width = None
        self.original_array_dim = None
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
                            "Added test case for inside operator in %s scope"
                            % (self.scope_type)
                        )

            # Visit children
            for c in node.children():
                self.visit(c)

def transform_inside_op_scope(input_file, output_file, signal_name, scope_type):
    """
    Transform a file to add test cases for inside operator in different scopes.

    Args:
        input_file (str): Path to input Verilog file
        output_file (str): Path to output Verilog file
        signal_name (str): Name of the signal to use in the test case
        scope_type (str): Type of scope to test

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
        visitor = InsideOpScopeVisitor(signal_name, scope_type)
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
        module_name = visitor.module_name or "test_module"

        # Based on the scope_type, determine how to transform the file
        if scope_type == "module":
            # For module scope, we'll add test logic inside the existing module
            # Find the module definition end (before endmodule) to add our test code
            module_end_match = re.search(r"((?:\n|.)*?)(\s*endmodule)", content)
            if not module_end_match:
                print("Warning: Could not find module end")
                return False

            module_content = module_end_match.group(1)
            module_end = module_end_match.group(2)

            # Add test logic for using inside operator within a module
            test_logic = """
  // Test case for inside operator in module scope
  reg [7:0] test_value;
  reg module_scope_result;
  
  // Example use of inside operator within module scope
  always @(*) begin
    module_scope_result = (test_value inside {8'd0, 8'd5, 8'd10});
  end
"""
            # Add the test logic before endmodule
            modified_content = module_content + test_logic + module_end

        elif scope_type == "interface":
            # For interface scope, we'll create a new interface with inside operator usage
            interface_code = """
// Interface with inside operator usage
interface test_inside_interface;
  logic [7:0] test_value;
  logic interface_result;
  
  // Example use of inside operator within interface scope
  always @(*) begin
    interface_result = (test_value inside {8'd0, 8'd5, 8'd10});
  end
  
  // Interface modport example
  modport test_mp (
    input test_value,
    output interface_result
  );
endinterface

// Original module with updated logic to use the interface
""" + content + """

// Example module that uses the interface
module interface_test (
  test_inside_interface.test_mp intf
);
  // Use the interface in the module
  always @(*) begin
    // The result is already calculated in the interface
    // Access via the interface
  end
endmodule
"""
            modified_content = interface_code

        elif scope_type == "package":
            # For package scope, we'll create a package with inside operator usage
            package_code = """
// Package with inside operator usage
package test_inside_package;
  // Package-level type definitions
  typedef enum logic [1:0] {RED, GREEN, BLUE} colors_t;
  
  // Package-level constants or variables
  parameter logic [7:0] ALLOWED_VALUES [3] = {8'd0, 8'd5, 8'd10};
  
  // Package-level function using inside operator
  function automatic logic is_allowed(logic [7:0] value);
    return (value inside ALLOWED_VALUES);
  endfunction
endpackage

// Original module with import of the package
""" + content.replace(f"module {module_name}", f"// Import the package\nimport test_inside_package::*;\n\nmodule {module_name}") + """

// Example module using the package
module package_test (
  input logic [7:0] test_value,
  output logic package_result
);
  // Use the function from the package
  assign package_result = is_allowed(test_value);
endmodule
"""
            modified_content = package_code

        elif scope_type == "sv_class":
            # For SystemVerilog class scope, we'll create a class with inside operator usage
            class_code = """
// Class with inside operator usage
class TestInsideClass;
  // Class properties
  logic [7:0] test_value;
  logic class_result;
  
  // Class method using inside operator
  function void check_value();
    class_result = (test_value inside {8'd0, 8'd5, 8'd10});
  endfunction
  
  // Constructor
  function new(logic [7:0] initial_value = 8'd0);
    test_value = initial_value;
    check_value();
  endfunction
endclass

// Original module with added logic to use the class
""" + content.replace("endmodule", """
  // Test case for inside operator in class scope
  initial begin
    TestInsideClass test_obj;
    logic class_scope_result;
    
    // Create class instance
    test_obj = new(8'd5);
    
    // Call method that uses inside operator
    test_obj.check_value();
    
    // Get result
    class_scope_result = test_obj.class_result;
  end
endmodule""")
            modified_content = class_code

        elif scope_type == "dollar_unit":
            # For $unit scope, we'll add declarations at the $unit scope
            unit_code = """
// $unit scope declarations
logic [7:0] unit_test_value;
logic unit_scope_result;

// Function at $unit scope using inside operator
function automatic logic is_allowed_unit(logic [7:0] value);
  return (value inside {8'd0, 8'd5, 8'd10});
endfunction

// Original module with added logic to use the $unit scope
""" + content.replace("endmodule", """
  // Test case for inside operator in $unit scope
  initial begin
    // Access $unit scope variable
    unit_test_value = 8'd5;
    
    // Call function from $unit scope
    unit_scope_result = is_allowed_unit(unit_test_value);
  end
endmodule""")
            modified_content = unit_code

        elif scope_type == "generate_block":
            # For generate block scope, we'll add a generate block with inside operator usage
            # Find the module definition end (before endmodule) to add our test code
            module_end_match = re.search(r"((?:\n|.)*?)(\s*endmodule)", content)
            if not module_end_match:
                print("Warning: Could not find module end")
                return False

            module_content = module_end_match.group(1)
            module_end = module_end_match.group(2)

            # Add generate block with inside operator
            test_logic = """
  // Test case for inside operator in generate block scope
  genvar i;
  
  // Simple generate for loop
  generate
    for (i = 0; i < 4; i++) begin : gen_loop
      // Variables in generate block scope
      logic [7:0] gen_test_value;
      logic gen_scope_result;
      
      // Logic using inside operator in generate block
      always @(*) begin
        gen_scope_result = (gen_test_value inside {8'd0 + i, 8'd5 + i, 8'd10 + i});
      end
    end
  endgenerate
  
  // Nested generate block with an escaped name
  generate
    if (1) begin : escaped_name_block
      // Variables in escaped name generate block
      logic [7:0] esc_test_value;
      logic esc_scope_result;
      
      // Logic using inside operator in escaped name generate block
      always @(*) begin
        esc_scope_result = (esc_test_value inside {8'd0, 8'd5, 8'd10});
      end
    end
  endgenerate
"""
            # Add the test logic before endmodule
            modified_content = module_content + test_logic + module_end

        else:
            # Default case if scope type is not recognized
            print(f"Warning: Scope type '{scope_type}' not recognized")
            return False

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
        description="Transform a file to add test cases for inside operator in different scopes"
    )
    parser.add_argument("input_file", help="Input Verilog file")
    parser.add_argument("output_file", help="Output Verilog file")
    parser.add_argument(
        "--signal", required=True, help="Name of the signal to use in the test case"
    )
    parser.add_argument(
        "--scope",
        required=True,
        choices=[
            "module",
            "interface",
            "package",
            "sv_class",
            "dollar_unit",
            "generate_block",
        ],
        help="Type of scope to test",
    )

    args = parser.parse_args()

    # Ensure input file exists
    if not os.path.exists(args.input_file):
        print("Error: Input file '%s' not found" % args.input_file)
        return 1

    # Process the file
    success = transform_inside_op_scope(
        args.input_file, args.output_file, args.signal, args.scope
    )

    return 0 if success else 1

if __name__ == "__main__":
    sys.exit(main())