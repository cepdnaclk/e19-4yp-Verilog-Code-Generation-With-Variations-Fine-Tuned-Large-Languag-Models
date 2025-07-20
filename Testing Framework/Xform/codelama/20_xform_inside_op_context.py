#!/usr/bin/env python3
"""
Transformation to create test cases for using the inside operator in different contexts.
This follows the pattern of the existing framework, using PyVerilog AST for analysis
and regex for the actual transformations.
"""

import sys
import os
import re
import argparse
from pyverilog.vparser.parser import parse
from pyverilog.vparser.ast import *


class InsideOpContextVisitor:
    """
    AST visitor that identifies modules to add inside operator context test cases.
    """

    def __init__(self, signal_name, context_type):
        """
        Initialize the visitor.

        Args:
            signal_name (str): Name of the signal to use in the test case
            context_type (str): Type of context to test (if_statement, case, etc.)
        """
        self.signal_name = signal_name
        self.context_type = context_type
        self.changes_made = []
        self.signal_found = False
        self.signal_type = None  # 'reg', 'wire', 'logic', etc.
        self.original_width = None
        self.original_array_dim = None

    def visit(self, node):
        """Visit a node and identify signals and modules to transform."""
        if isinstance(node, Node):
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
                            "Added test case for inside operator in %s context"
                            % (self.context_type)
                        )

            # Also check at the module level to capture the module name
            if isinstance(node, ModuleDef):
                for item in node.portlist.ports:
                    # Just to ensure we're in a module
                    pass

            # Visit children
            for c in node.children():
                self.visit(c)


def transform_inside_op_context(input_file, output_file, signal_name, context_type):
    """
    Transform a file to add test cases for inside operator in different contexts.

    Args:
        input_file (str): Path to input Verilog file
        output_file (str): Path to output Verilog file
        signal_name (str): Name of the signal to use in the test case
        context_type (str): Type of context to test

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
        visitor = InsideOpContextVisitor(signal_name, context_type)
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

        # Find the module definition end (before endmodule) to add our test code
        module_end_match = re.search(r"((?:\n|.)*?)(\s*endmodule)", content)
        if not module_end_match:
            print("Warning: Could not find module end")
            return False

        module_content = module_end_match.group(1)
        module_end = module_end_match.group(2)

        # Create test logic based on context_type
        test_logic = ""

        if context_type == "if_statement":
            # Test inside operator in if statement
            test_logic = f"""
  // Test case for inside operator in if statement
  reg [7:0] test_value;
  reg if_result;
  
  // Example if statement using inside operator
  always @(*) begin
    if (test_value inside {{8'd0, 8'd10, 8'd20, 8'd30, 8'd40}}) begin
      if_result = 1'b1;
    end else begin
      if_result = 1'b0;
    end
  end
  
  // Nested if with inside operator
  always @(*) begin
    if ({signal_name}[0] inside {{8'd0, 8'd1}}) begin
      if ({signal_name}[1] inside {{8'd2, 8'd3}}) begin
        // Nested inside operations
      end
    end
  end
"""
        elif context_type == "case":
            # Test inside operator in case statement
            test_logic = f"""
  // Test case for inside operator in case statement
  reg [7:0] test_value;
  reg [1:0] case_result;
  
  // Example case statement using inside operator
  always @(*) begin
    case (1'b1)
      (test_value inside {{8'd0, 8'd10}}): case_result = 2'd0;
      (test_value inside {{8'd20, 8'd30}}): case_result = 2'd1;
      (test_value inside {{8'd40, 8'd50}}): case_result = 2'd2;
      default: case_result = 2'd3;
    endcase
  end
"""
        elif context_type == "loop":
            # Test inside operator in while/for loop
            test_logic = f"""
  // Test case for inside operator in while/for loop
  reg [7:0] loop_var;
  reg [7:0] loop_result;
  
  // Example while loop with inside operator
  initial begin
    loop_var = 8'd0;
    loop_result = 8'd0;
    
    while (loop_var inside {{8'd0, 8'd1, 8'd2, 8'd3, 8'd4}}) begin
      loop_result = loop_result + 1;
      loop_var = loop_var + 1;
    end
    
    // For loop with inside operator
    for (int i = 0; i < 10; i++) begin
      if (i inside {{2, 4, 6, 8}}) begin
        loop_result = loop_result + 1;
      end
    end
  end
"""
        elif context_type == "continuous_assign":
            # Test inside operator in continuous assign
            test_logic = f"""
  // Test case for inside operator in continuous assign
  reg [7:0] test_value;
  wire assign_result;
  
  // Example continuous assign with inside operator
  assign assign_result = (test_value inside {{8'd0, 8'd10, 8'd20}});
  
  // Multiple continuous assigns with inside operator
  wire [1:0] multi_result;
  assign multi_result[0] = ({signal_name}[0] inside {{8'd0, 8'd1}});
  assign multi_result[1] = ({signal_name}[1] inside {{8'd2, 8'd3}});
"""
        elif context_type == "procedural_continuous_assign":
            # Test inside operator in procedural continuous assign
            test_logic = f"""
  // Test case for inside operator in procedural continuous assign
  reg [7:0] test_value;
  reg assign_result;
  
  // Example procedural continuous assign with inside operator
  always @(*) begin
    assign_result = (test_value inside {{8'd0, 8'd10, 8'd20}});
  end
"""
        elif context_type == "procedural_assign_initial_final":
            # Test inside operator in procedural assign in initial/final blocks
            test_logic = f"""
  // Test case for inside operator in procedural assign in initial/final blocks
  reg [7:0] test_value;
  reg initial_result;
  
  // Example initial block with inside operator
  initial begin
    test_value = 8'd5;
    initial_result = (test_value inside {{8'd0, 8'd5, 8'd10}});
  end
  
  // Example final block with inside operator
  final begin
    initial_result = (test_value inside {{8'd0, 8'd5, 8'd10}});
  end
"""
        elif context_type == "variable_initialization":
            # Test inside operator in variable initialization
            test_logic = f"""
  // Test case for inside operator in variable initialization
  reg [7:0] test_value = 8'd5;
  
  // Example variable initialization with inside operator
  initial begin
    reg init_result = (test_value inside {{8'd0, 8'd5, 8'd10}});
    reg [1:0] multi_init;
    
    multi_init[0] = ({signal_name}[0] inside {{8'd0, 8'd1}});
    multi_init[1] = ({signal_name}[1] inside {{8'd2, 8'd3}});
  end
"""
        elif context_type == "always_comb":
            # Test inside operator in always, always_comb
            test_logic = f"""
  // Test case for inside operator in always_comb
  reg [7:0] test_value;
  reg always_result;
  
  // Example always_comb with inside operator
  always_comb begin
    always_result = (test_value inside {{8'd0, 8'd10, 8'd20}});
  end
  
  // Example always with inside operator
  always @(*) begin
    always_result = (test_value inside {{8'd0, 8'd10, 8'd20}});
  end
"""
        elif context_type == "initial_final_blocks":
            # Test inside operator in initial and final blocks
            test_logic = f"""
  // Test case for inside operator in initial and final blocks
  reg [7:0] test_value;
  reg block_result;
  
  // Example initial block with inside operator
  initial begin
    test_value = 8'd5;
    block_result = (test_value inside {{8'd0, 8'd5, 8'd10}});
  end
  
  // Example final block with inside operator
  final begin
    block_result = (test_value inside {{8'd0, 8'd5, 8'd10}});
  end
"""
        elif context_type == "module_highconn":
            # Test inside operator in module high connections (negative scenario)
            test_logic = f"""
  // Test case for inside operator in module high connections (negative scenario)
  reg [7:0] test_value;
  
  // Example submodule instantiation 
  // Note: Using inside operator directly in port connections might not be supported
  // This is a negative test case
  sub_module sub1 (
    .port_a(test_value),
    .port_b(({signal_name}[0] inside {{8'd0, 8'd1}}))  // This might be invalid syntax
  );
"""
        elif context_type == "case_inside":
            # Test case inside including unique/priority case
            test_logic = f"""
  // Test case for case inside operator including unique/priority case
  reg [7:0] test_value;
  reg [1:0] case_result;
  
  // Example case inside statement
  always @(*) begin
    case (test_value) inside
      8'd0, 8'd10: case_result = 2'd0;
      8'd20, 8'd30: case_result = 2'd1;
      8'd40, 8'd50: case_result = 2'd2;
      default: case_result = 2'd3;
    endcase
  end
  
  // Example unique case inside statement
  always @(*) begin
    unique case (test_value) inside
      8'd0, 8'd10: case_result = 2'd0;
      8'd20, 8'd30: case_result = 2'd1;
      default: case_result = 2'd3;
    endcase
  end
  
  // Example priority case inside statement
  always @(*) begin
    priority case (test_value) inside
      8'd0, 8'd10: case_result = 2'd0;
      8'd0, 8'd20: case_result = 2'd1;  // Overlapping pattern with higher item
      default: case_result = 2'd3;
    endcase
  end
"""
        else:
            # Default test case
            test_logic = f"""
  // Test case for inside operator in generic context
  reg [7:0] test_value;
  reg test_result;
  
  // Example use of inside operator
  initial begin
    test_value = 8'd5;
    test_result = (test_value inside {{8'd0, 8'd5, 8'd10}});
  end
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
        description="Transform a file to add test cases for inside operator in different contexts"
    )
    parser.add_argument("input_file", help="Input Verilog file")
    parser.add_argument("output_file", help="Output Verilog file")
    parser.add_argument(
        "--signal", required=True, help="Name of the signal to use in the test case"
    )
    parser.add_argument(
        "--context",
        required=True,
        choices=[
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
        help="Type of context to test",
    )

    args = parser.parse_args()

    # Ensure input file exists
    if not os.path.exists(args.input_file):
        print("Error: Input file '%s' not found" % args.input_file)
        return 1

    # Process the file
    success = transform_inside_op_context(
        args.input_file, args.output_file, args.signal, args.context
    )

    return 0 if success else 1


if __name__ == "__main__":
    sys.exit(main())
