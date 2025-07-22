#!/usr/bin/env python3
"""
Transformation to create test cases for using XMR (Cross-Module Reference) with
inside operator in different scenarios.
"""

import sys
import os
import re
import argparse
from pyverilog.vparser.parser import parse
from pyverilog.vparser.ast import *


class InsideOpXMRVisitor:
    """
    AST visitor that identifies modules to add inside operator XMR test cases.
    """

    def __init__(self, signal_name, xmr_type):
        """
        Initialize the visitor.

        Args:
            signal_name (str): Name of the signal to use in the test case
            xmr_type (str): Type of XMR to test (module_xmr, interface_xmr, etc.)
        """
        self.signal_name = signal_name
        self.xmr_type = xmr_type
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
                            "Added test case for XMR with inside operator: %s"
                            % (self.xmr_type)
                        )

            # Visit children
            for c in node.children():
                self.visit(c)


def transform_inside_op_xmr(input_file, output_file, signal_name, xmr_type):
    """
    Transform a file to add test cases for XMR with inside operator.

    Args:
        input_file (str): Path to input Verilog file
        output_file (str): Path to output Verilog file
        signal_name (str): Name of the signal to use in the test case
        xmr_type (str): Type of XMR to test

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
        visitor = InsideOpXMRVisitor(signal_name, xmr_type)
        visitor.visit(ast)

        # Check if the signal was found
        if not visitor.signal_found:
            print("Warning: Signal '%s' not found" % signal_name)
            # Continue anyway for XMR tests

        # Print summary of changes
        for change in visitor.changes_made:
            print(change)

        # Get the extracted information from the visitor
        signal_type = visitor.signal_type
        original_width = visitor.original_width or ""
        original_array_dim = visitor.original_array_dim or ""
        module_name = visitor.module_name or "simple_array_example"

        # Based on the xmr_type, determine how to transform the file
        if xmr_type == "module_xmr":
            # Create top module and sub modules with XMR used in inside operator
            xmr_code = f"""
// Module hierarchy for XMR testing with inside operator
// Sub module containing array to be referenced
module sub_module(
  input clk,
  input rst
);
  // Array to be accessed via XMR
  logic [7:0] sub_array [0:15];
  logic [7:0] scalar_value;
  
  // Initialize the array
  initial begin
    for (int i = 0; i < 16; i++) begin
      sub_array[i] = i * 10;
    end
    scalar_value = 8'd50;
  end
endmodule

// Main test module - original content altered to include XMR tests
module {module_name}(
  input clk,
  input rst,
  input [7:0] data_in,
  output [7:0] data_out
);
  // Instantiate sub modules
  sub_module sub_instance();
  
  // Original code from the module
  {content.split("module " + module_name)[1].split("endmodule")[0].strip()}
  
  // Test case for XMR with inside operator
  logic xmr_array_result;
  logic xmr_scalar_result;
  logic [7:0] test_value;
  
  // XMR with array in range list of inside operator
  always @(*) begin
    // Test if value is inside the array accessed via XMR
    xmr_array_result = (test_value inside {{sub_instance.sub_array}});
  end
  
  // XMR with LHS variable used in inside operator
  always @(*) begin
    // Test if the XMR variable is inside a set of values
    xmr_scalar_result = (sub_instance.scalar_value inside {{8'd10, 8'd20, 8'd30, 8'd40, 8'd50}});
  end
endmodule
"""
            modified_content = xmr_code

        elif xmr_type == "interface_xmr":
            # Create interface and module with XMR to interface used in inside operator
            xmr_code = f"""
// Interface for XMR testing with inside operator
interface test_xmr_if;
  // Array to be accessed via XMR
  logic [7:0] if_array [0:15];
  logic [7:0] if_scalar;
  
  // Initialize the array
  initial begin
    for (int i = 0; i < 16; i++) begin
      if_array[i] = i * 5;
    end
    if_scalar = 8'd15;
  end
  
  // Modport for external access
  modport mp (input if_array, if_scalar);
endinterface

// Original module with added XMR to interface tests
module {module_name}(
  input clk,
  input rst,
  input [7:0] data_in,
  output [7:0] data_out
);
  // Instantiate the interface
  test_xmr_if xmr_if_inst();
  
  // Original code from the module
  {content.split("module " + module_name)[1].split("endmodule")[0].strip()}
  
  // Test case for interface XMR with inside operator
  logic if_xmr_array_result;
  logic if_xmr_scalar_result;
  logic [7:0] test_value;
  
  // Interface XMR with array in range list of inside operator
  always @(*) begin
    // Test if value is inside the array accessed via XMR to interface
    if_xmr_array_result = (test_value inside {{xmr_if_inst.if_array}});
  end
  
  // Interface XMR with LHS variable used in inside operator
  always @(*) begin
    // Test if the XMR variable is inside a set of values
    if_xmr_scalar_result = (xmr_if_inst.if_scalar inside {{8'd5, 8'd10, 8'd15, 8'd20, 8'd25}});
  end
endmodule
"""
            modified_content = xmr_code

        elif xmr_type == "class_xmr":
            # Create class and module with XMR to class instance used in inside operator
            xmr_code = f"""
// Class for XMR testing with inside operator
class TestXMRClass;
  // Array to be accessed via XMR
  logic [7:0] class_array [0:15];
  logic [7:0] class_scalar;
  static logic [7:0] static_array [0:7];
  
  // Constructor to initialize the array
  function new();
    for (int i = 0; i < 16; i++) begin
      class_array[i] = i * 2;
    end
    class_scalar = 8'd6;
    
    // Initialize static array (if not already)
    if (static_array[0] === 8'dx) begin
      for (int i = 0; i < 8; i++) begin
        static_array[i] = i * 3;
      end
    end
  endfunction
endclass

// Original module with added XMR to class tests
module {module_name}(
  input clk,
  input rst,
  input [7:0] data_in,
  output [7:0] data_out
);
  // Original code from the module
  {content.split("module " + module_name)[1].split("endmodule")[0].strip()}
  
  // Test case for class XMR with inside operator
  TestXMRClass class_inst;
  logic class_xmr_array_result;
  logic class_xmr_scalar_result;
  logic class_xmr_static_result;
  logic [7:0] test_value;
  
  // Initialize class instance
  initial begin
    class_inst = new();
  end
  
  // Class XMR with array in range list of inside operator
  always @(*) begin
    // Test if value is inside the array accessed via XMR to class instance
    class_xmr_array_result = (test_value inside {{class_inst.class_array}});
  end
  
  // Class XMR with LHS variable used in inside operator
  always @(*) begin
    // Test if the XMR variable is inside a set of values
    class_xmr_scalar_result = (class_inst.class_scalar inside {{8'd2, 8'd4, 8'd6, 8'd8, 8'd10}});
  end
  
  // Class XMR with static array in inside operator
  always @(*) begin
    // Test with static class member
    class_xmr_static_result = (test_value inside {{TestXMRClass::static_array}});
  end
endmodule
"""
            modified_content = xmr_code

        elif xmr_type == "virtual_interface_xmr":
            # Create virtual interface and module with XMR used in inside operator
            xmr_code = f"""
// Interface for virtual interface XMR testing with inside operator
interface v_test_xmr_if;
  // Array to be accessed via XMR through virtual interface
  logic [7:0] vif_array [0:15];
  logic [7:0] vif_scalar;
  
  // Initialize the array
  initial begin
    for (int i = 0; i < 16; i++) begin
      vif_array[i] = i + 50;
    end
    vif_scalar = 8'd55;
  end
endinterface

// Class using virtual interface
class VifTestClass;
  // Virtual interface
  virtual v_test_xmr_if vif;
  
  // Constructor
  function new(virtual v_test_xmr_if vif_arg);
    this.vif = vif_arg;
  endfunction
  
  // Method using inside operator with virtual interface XMR
  function logic check_value(logic [7:0] value);
    return (value inside {{vif.vif_array}});
  endfunction
  
  // Method using inside operator with virtual interface scalar
  function logic check_scalar();
    return (vif.vif_scalar inside {{8'd53, 8'd54, 8'd55, 8'd56}});
  endfunction
endclass

// Original module with added virtual interface XMR tests
module {module_name}(
  input clk,
  input rst,
  input [7:0] data_in,
  output [7:0] data_out
);
  // Instantiate the interface
  v_test_xmr_if vif_inst();
  
  // Original code from the module
  {content.split("module " + module_name)[1].split("endmodule")[0].strip()}
  
  // Test case for virtual interface XMR with inside operator
  VifTestClass vif_test_obj;
  logic vif_xmr_array_result;
  logic vif_xmr_scalar_result;
  logic [7:0] test_value;
  
  // Initialize class instance with virtual interface
  initial begin
    vif_test_obj = new(vif_inst);
    test_value = 8'd52;
  end
  
  // Access virtual interface through class methods
  initial begin
    vif_xmr_array_result = vif_test_obj.check_value(test_value);
    vif_xmr_scalar_result = vif_test_obj.check_scalar();
  end
endmodule
"""
            modified_content = xmr_code

        elif xmr_type == "structure_xmr":
            # Create struct and module with XMR to struct used in inside operator
            xmr_code = f"""
// Original module with added struct XMR tests
module {module_name}(
  input clk,
  input rst,
  input [7:0] data_in,
  output [7:0] data_out
);
  // Define struct type with array and scalar
  typedef struct {{
    logic [7:0] struct_array [0:15];
    logic [7:0] struct_scalar;
  }} test_struct_t;
  
  // Instance of the struct
  test_struct_t struct_inst;
  
  // Original code from the module
  {content.split("module " + module_name)[1].split("endmodule")[0].strip()}
  
  // Test case for struct XMR with inside operator
  logic struct_xmr_array_result;
  logic struct_xmr_scalar_result;
  logic [7:0] test_value;
  
  // Initialize the struct
  initial begin
    for (int i = 0; i < 16; i++) begin
      struct_inst.struct_array[i] = i * 4;
    end
    struct_inst.struct_scalar = 8'd20;
  end
  
  // Struct XMR with array in range list of inside operator
  always @(*) begin
    // Test if value is inside the array accessed via XMR to struct field
    struct_xmr_array_result = (test_value inside {{struct_inst.struct_array}});
  end
  
  // Struct XMR with LHS variable used in inside operator
  always @(*) begin
    // Test if the XMR variable is inside a set of values
    struct_xmr_scalar_result = (struct_inst.struct_scalar inside {{8'd10, 8'd15, 8'd20, 8'd25}});
  end
endmodule
"""
            modified_content = xmr_code

        elif xmr_type == "package_xmr":
            # Create package and module with XMR to package used in inside operator
            xmr_code = f"""
// Package for XMR testing with inside operator
package test_xmr_pkg;
  // Package array and variable
  logic [7:0] pkg_array [0:15];
  logic [7:0] pkg_scalar = 8'd30;
  
  // Function to initialize the array
  function automatic void init_pkg_array();
    for (int i = 0; i < 16; i++) begin
      pkg_array[i] = i * 8;
    end
  endfunction
  
  // Initialize array using elaboration-time function
  initial begin
    init_pkg_array();
  end
endpackage

// Original module with added package XMR tests
module {module_name}(
  input clk,
  input rst,
  input [7:0] data_in,
  output [7:0] data_out
);
  // Import the package
  import test_xmr_pkg::*;
  
  // Original code from the module
  {content.split("module " + module_name)[1].split("endmodule")[0].strip()}
  
  // Test case for package XMR with inside operator
  logic pkg_xmr_array_result;
  logic pkg_xmr_scalar_result;
  logic [7:0] test_value;
  
  // Package XMR with array in range list of inside operator
  always @(*) begin
    // Test if value is inside the array accessed via XMR to package
    pkg_xmr_array_result = (test_value inside {{test_xmr_pkg::pkg_array}});
  end
  
  // Package XMR with LHS variable used in inside operator
  always @(*) begin
    // Test if the XMR variable is inside a set of values
    pkg_xmr_scalar_result = (test_xmr_pkg::pkg_scalar inside {{8'd20, 8'd25, 8'd30, 8'd35}});
  end
endmodule
"""
            modified_content = xmr_code

        elif xmr_type == "mix_xmr":
            # Create mixed XMR scenario with module, interface, class, etc.
            xmr_code = f"""
// Package for mixed XMR testing
package mixed_xmr_pkg;
  logic [7:0] pkg_array [0:7] = '{{8'd10, 8'd20, 8'd30, 8'd40, 8'd50, 8'd60, 8'd70, 8'd80}};
  logic [7:0] pkg_scalar = 8'd25;
endpackage

// Interface for mixed XMR testing
interface mixed_xmr_if;
  logic [7:0] if_array [0:3] = '{{8'd5, 8'd15, 8'd25, 8'd35}};
  logic [7:0] if_scalar = 8'd15;
endinterface

// Class for mixed XMR testing
class MixedXMRClass;
  logic [7:0] cls_array [0:3] = '{{8'd2, 8'd4, 8'd6, 8'd8}};
  logic [7:0] cls_scalar = 8'd6;
  
  // Virtual interface reference
  virtual mixed_xmr_if vif;
  
  function new(virtual mixed_xmr_if vif_arg);
    this.vif = vif_arg;
  endfunction
endclass

// Sub module for mixed XMR testing
module mixed_sub_module;
  logic [7:0] sub_array [0:3] = '{{8'd1, 8'd3, 8'd5, 8'd7}};
  logic [7:0] sub_scalar = 8'd5;
endmodule

// Original module with mixed XMR tests
module {module_name}(
  input clk,
  input rst,
  input [7:0] data_in,
  output [7:0] data_out
);
  // Import the package
  import mixed_xmr_pkg::*;
  
  // Instantiate interface and sub module
  mixed_xmr_if xmr_if_inst();
  mixed_sub_module sub_inst();
  
  // Define struct with array
  typedef struct {{
    logic [7:0] s_array [0:3];
    logic [7:0] s_scalar;
  }} mix_struct_t;
  
  mix_struct_t struct_inst;
  MixedXMRClass cls_obj;
  
  // Initialize struct
  initial begin
    struct_inst.s_array = '{{8'd9, 8'd18, 8'd27, 8'd36}};
    struct_inst.s_scalar = 8'd18;
    cls_obj = new(xmr_if_inst);
  end
  
  // Original code from the module
  {content.split("module " + module_name)[1].split("endmodule")[0].strip()}
  
  // Test case for mixed XMR with inside operator
  logic mix_result_1, mix_result_2, mix_result_3;
  logic [7:0] test_value;
  
  // Mixed XMR test 1: Test with multiple XMR arrays in range list
  always @(*) begin
    // Test if value is inside any of several XMR arrays
    mix_result_1 = (test_value inside {{
      mixed_xmr_pkg::pkg_array,   // Package array
      xmr_if_inst.if_array,       // Interface array
      cls_obj.cls_array,          // Class instance array
      sub_inst.sub_array,         // Sub module array
      struct_inst.s_array         // Struct array
    }});
  end
  
  // Mixed XMR test 2: Test with multiple XMR scalars as values to check
  always @(*) begin
    // Test if test_value matches any of the XMR scalars
    mix_result_2 = (test_value inside {{
      mixed_xmr_pkg::pkg_scalar,  // Package scalar
      xmr_if_inst.if_scalar,      // Interface scalar
      cls_obj.cls_scalar,         // Class instance scalar
      sub_inst.sub_scalar,        // Sub module scalar
      struct_inst.s_scalar        // Struct scalar
    }});
  end
  
  // Mixed XMR test 3: Test with XMR scalar on LHS
  always @(*) begin
    // Test different XMR scalars against set of values
    mix_result_3 = (
      (mixed_xmr_pkg::pkg_scalar inside {{8'd20, 8'd25, 8'd30}}) &&
      (xmr_if_inst.if_scalar inside {{8'd10, 8'd15, 8'd20}}) &&
      (cls_obj.cls_scalar inside {{8'd4, 8'd6, 8'd8}}) &&
      (sub_inst.sub_scalar inside {{8'd3, 8'd5, 8'd7}}) &&
      (struct_inst.s_scalar inside {{8'd16, 8'd18, 8'd20}})
    );
  end
endmodule
"""
            modified_content = xmr_code

        else:
            # Default case if XMR type is not recognized
            print(f"Warning: XMR type '{xmr_type}' not recognized")
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
        description="Transform a file to add test cases for XMR with inside operator"
    )
    parser.add_argument("input_file", help="Input Verilog file")
    parser.add_argument("output_file", help="Output Verilog file")
    parser.add_argument(
        "--signal", required=True, help="Name of the signal to use in the test case"
    )
    parser.add_argument(
        "--xmr-type",
        required=True,
        choices=[
            "module_xmr",
            "interface_xmr",
            "class_xmr",
            "virtual_interface_xmr",
            "structure_xmr",
            "package_xmr",
            "mix_xmr",
        ],
        help="Type of XMR to test",
    )

    args = parser.parse_args()

    # Ensure input file exists
    if not os.path.exists(args.input_file):
        print("Error: Input file '%s' not found" % args.input_file)
        return 1

    # Process the file
    success = transform_inside_op_xmr(
        args.input_file, args.output_file, args.signal, args.xmr_type
    )

    return 0 if success else 1


if __name__ == "__main__":
    sys.exit(main())
