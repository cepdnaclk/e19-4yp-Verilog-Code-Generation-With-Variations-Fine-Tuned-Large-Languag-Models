#!/usr/bin/env python3
"""
Transformation to create test cases for miscellaneous/incoming learning scenarios
of the inside operator. This includes advanced edge cases and special scenarios.
"""

import sys
import os
import re
import argparse
from pyverilog.vparser.parser import parse
from pyverilog.vparser.ast import *


class InsideOpMiscVisitor:
    """
    AST visitor that identifies modules to add inside operator miscellaneous test cases.
    """

    def __init__(self, signal_name, misc_type):
        """
        Initialize the visitor.

        Args:
            signal_name (str): Name of the signal to use in the test case
            misc_type (str): Type of miscellaneous test to perform
        """
        self.signal_name = signal_name
        self.misc_type = misc_type
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
                            "Added miscellaneous test case for inside operator: %s"
                            % (self.misc_type)
                        )

            # Visit children
            for c in node.children():
                self.visit(c)


def transform_inside_op_misc(input_file, output_file, signal_name, misc_type):
    """
    Transform a file to add miscellaneous test cases for inside operator.

    Args:
        input_file (str): Path to input Verilog file
        output_file (str): Path to output Verilog file
        signal_name (str): Name of the signal to use in the test case
        misc_type (str): Type of miscellaneous test to perform

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
        visitor = InsideOpMiscVisitor(signal_name, misc_type)
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

        # Based on the misc_type, determine what test to add
        if misc_type == "x_z_values":
            # Test with 'x and 'z values for array members
            test_logic = f"""
  // Miscellaneous test case: 'x and 'z values for array members
  logic [7:0] test_value;
  logic [7:0] x_z_array [0:7];
  logic x_z_result1, x_z_result2, x_z_result3;
  
  initial begin
    // Initialize array with mix of values including x and z
    x_z_array[0] = 8'h00;
    x_z_array[1] = 8'h0A;
    x_z_array[2] = 8'hXX;  // All X values
    x_z_array[3] = 8'hZZ;  // All Z values
    x_z_array[4] = 8'h5X;  // Mixed values
    x_z_array[5] = 8'hZ5;  // Mixed values
    x_z_array[6] = 8'hAZ;  // Mixed values
    x_z_array[7] = 8'hFF;
  end
  
  // Test with different x/z scenarios
  always @(*) begin
    test_value = 8'h0A;
    // Test 1: Check if known value is inside array with x/z values
    x_z_result1 = (test_value inside {{x_z_array}});
    
    // Test 2: Check if x value matches
    test_value = 8'hXX;
    x_z_result2 = (test_value inside {{x_z_array}});
    
    // Test 3: Check if z value matches
    test_value = 8'hZZ;
    x_z_result3 = (test_value inside {{x_z_array}});
  end
"""

        elif misc_type == "zero_select":
            # Test [0:0] select on array
            test_logic = f"""
  // Miscellaneous test case: [0:0] select on array
  logic [7:0] test_array [0:15];
  logic [7:0] single_bit_array [0:7];
  logic [7:0] test_value;
  logic zero_select_result1, zero_select_result2;
  
  initial begin
    // Initialize arrays
    for (int i = 0; i < 16; i++) begin
      test_array[i] = i * 3;
    end
    
    for (int i = 0; i < 8; i++) begin
      single_bit_array[i] = {{7'b0, test_array[i][0]}};  // Extract bit 0
    end
    
    test_value = 8'h01;
  end
  
  // Test [0:0] bit selection within inside operator
  always @(*) begin
    // Test 1: Use bit selection in range list
    zero_select_result1 = (test_value[0:0] inside {{
      test_array[0][0:0], 
      test_array[1][0:0], 
      test_array[2][0:0]
    }});
    
    // Test 2: Compare with array of single bits
    zero_select_result2 = (test_value inside {{single_bit_array}});
  end
"""

        elif misc_type == "comparison_result":
            # Test for scenarios where comparison result in x, inside operator shall return 1'bx
            test_logic = f"""
  // Miscellaneous test case: comparison result with x values
  logic [7:0] test_value;
  logic [7:0] x_value_array [0:3];
  logic comp_result_x;
  
  initial begin
    test_value = 8'h5A;
    // Array with x values
    x_value_array[0] = 8'h50;
    x_value_array[1] = 8'hXX;  // This should cause x result
    x_value_array[2] = 8'h5A;
    x_value_array[3] = 8'h60;
  end
  
  // Test where comparison with x should result in x
  always @(*) begin
    // When test_value is compared with x_value_array[1] (8'hXX),
    // the comparison should result in x, making inside operator return 1'bx
    comp_result_x = (test_value inside {{x_value_array}});
  end
"""

        elif misc_type == "unsized_literal":
            # Test unsized literal as array members in inside operator
            test_logic = f"""
  // Miscellaneous test case: unsized literal as array members
  logic [7:0] test_value;
  logic unsized_result1, unsized_result2, unsized_result3;
  
  initial begin
    test_value = 8'h0A;
  end
  
  // Test with unsized literals in inside operator
  always @(*) begin
    // Test 1: Mix of sized and unsized literals
    unsized_result1 = (test_value inside {{'h0A, 'h15, 8'h20, 'h2F}});
    
    // Test 2: All unsized literals
    unsized_result2 = (test_value inside {{'h0A, 'h0B, 'h0C, 'h0D}});
    
    // Test 3: Unsized literals with different bit patterns
    unsized_result3 = (test_value inside {{10, 'h0A, 'b1010, 'o12}});  // All represent 10
  end
"""

        elif misc_type == "open_range_error":
            # Test open_range_list has more than one array
            test_logic = f"""
  // Miscellaneous test case: open_range_list with multiple arrays (potential error)
  logic [7:0] test_value;
  logic [7:0] array1 [0:7];
  logic [7:0] array2 [0:7];
  logic [7:0] array3 [0:7];
  logic open_range_result;
  
  initial begin
    // Initialize arrays
    for (int i = 0; i < 8; i++) begin
      array1[i] = i;
      array2[i] = i + 10;
      array3[i] = i + 20;
    end
    test_value = 8'd5;
  end
  
  // Test with multiple arrays in range list (may cause issues)
  always @(*) begin
    // This syntax might not be supported by all tools
    // Testing multiple array references in single inside operator
    open_range_result = (test_value inside {{array1, array2, array3}});
  end
"""

        elif misc_type == "initial_block":
            # Test array locally defined in initial block
            test_logic = f"""
  // Miscellaneous test case: array locally defined in initial block
  logic initial_block_result;
  logic [7:0] global_test_value;
  
  initial begin
    // Local array definition within initial block
    logic [7:0] local_array [0:7];
    logic [7:0] local_test_value;
    
    // Initialize local array
    for (int i = 0; i < 8; i++) begin
      local_array[i] = i * 5;
    end
    
    local_test_value = 8'd15;
    global_test_value = 8'd15;
    
    // Use inside operator with locally defined array
    initial_block_result = (local_test_value inside {{local_array}});
    
    // Display result
    $display("Local array inside result: %b", initial_block_result);
  end
"""

        elif misc_type == "empty_vsa":
            # Test empty VSA (Variable Size Array) with inside operator
            test_logic = f"""
  // Miscellaneous test case: empty VSA with inside operator
  logic [7:0] test_value;
  logic [7:0] empty_queue [$];
  logic [7:0] populated_queue [$];
  logic empty_vsa_result1, empty_vsa_result2;
  
  initial begin
    test_value = 8'h25;
    
    // Leave empty_queue empty (size 0)
    
    // Populate the other queue
    populated_queue.push_back(8'h20);
    populated_queue.push_back(8'h25);
    populated_queue.push_back(8'h30);
  end
  
  // Test with empty and populated queues
  always @(*) begin
    // Test 1: Inside operator with empty queue (should return 0)
    empty_vsa_result1 = (test_value inside {{empty_queue}});
    
    // Test 2: Inside operator with populated queue
    empty_vsa_result2 = (test_value inside {{populated_queue}});
  end
"""

        elif misc_type == "array_methods":
            # Test cover array methods in singular expression of inside operator
            test_logic = f"""
  // Miscellaneous test case: array methods in inside operator expression
  logic [7:0] test_value;
  logic [7:0] dynamic_array [];
  logic [7:0] queue_array [$];
  logic array_methods_result1, array_methods_result2, array_methods_result3;
  
  initial begin
    test_value = 8'h30;
    
    // Initialize dynamic array
    dynamic_array = new[8];
    for (int i = 0; i < 8; i++) begin
      dynamic_array[i] = i * 10;
    end
    
    // Initialize queue
    for (int i = 0; i < 6; i++) begin
      queue_array.push_back(i * 5);
    end
  end
  
  // Test array methods within inside operator
  always @(*) begin
    // Test 1: Using array size method
    array_methods_result1 = (dynamic_array.size() inside {{6, 7, 8, 9}});
    
    // Test 2: Using queue size method  
    array_methods_result2 = (queue_array.size() inside {{4, 5, 6, 7}});
    
    // Test 3: Test value against array elements
    array_methods_result3 = (test_value inside {{dynamic_array}});
  end
"""

        elif misc_type == "generate_loop":
            # Test generate loop variable in case_expression of case inside
            test_logic = f"""
  // Miscellaneous test case: generate loop variable in case inside
  logic [7:0] test_value;
  logic [3:0] gen_results [0:7];
  
  // Generate loop with inside operator in case statement
  genvar i;
  generate
    for (i = 0; i < 8; i++) begin : gen_loop
      always @(*) begin
        case (test_value) inside
          i, i+10, i+20: gen_results[i] = 4'b0001;  // Use generate variable
          i+5, i+15:     gen_results[i] = 4'b0010;
          default:       gen_results[i] = 4'b0000;
        endcase
      end
    end
  endgenerate
  
  initial begin
    test_value = 8'd3;  // Should match i=3 case
  end
"""

        elif misc_type == "case_expression":
            # Test case_expression of case inside statement
            test_logic = f"""
  // Miscellaneous test case: complex case_expression in case inside
  logic [7:0] test_input;
  logic [7:0] range_array [0:15];
  logic [3:0] case_expr_result;
  logic [7:0] computed_value;
  
  initial begin
    // Initialize range array
    for (int i = 0; i < 16; i++) begin
      range_array[i] = i * 2;
    end
    test_input = 8'h14;  // 20 in decimal
  end
  
  // Complex case expression using inside
  always @(*) begin
    computed_value = test_input + 8'h06;  // Add offset
    
    case (computed_value) inside  // computed_value = 26
      range_array:               case_expr_result = 4'h1;  // Check if in array
      8'h10, 8'h20, 8'h30:      case_expr_result = 4'h2;  // Specific values
      [8'h18:8'h1F]:            case_expr_result = 4'h3;  // Range 24-31
      default:                  case_expr_result = 4'h0;
    endcase
  end
"""

        elif misc_type == "always_comb":
            # Test case statement is inside always_comb -> generate loop
            test_logic = f"""
  // Miscellaneous test case: case inside within always_comb and generate
  logic [7:0] test_signal;
  logic [7:0] comb_array [0:7];
  logic [2:0] comb_result;
  logic [2:0] gen_results [0:3];
  
  initial begin
    // Initialize array
    for (int i = 0; i < 8; i++) begin
      comb_array[i] = i * 3;
    end
    test_signal = 8'd9;  // Should match comb_array[3]
  end
  
  // Case inside within always_comb
  always_comb begin
    case (test_signal) inside
      comb_array[0:3]:    comb_result = 3'b001;
      comb_array[4:7]:    comb_result = 3'b010;
      8'h50, 8'h60:      comb_result = 3'b100;
      default:           comb_result = 3'b000;
    endcase
  end
  
  // Generate loop with always_comb containing case inside
  genvar j;
  generate
    for (j = 0; j < 4; j++) begin : gen_comb
      always_comb begin
        case (test_signal) inside
          j*4, (j*4)+1, (j*4)+2, (j*4)+3: gen_results[j] = 3'b111;
          default:                        gen_results[j] = 3'b000;
        endcase
      end
    end
  endgenerate
"""

        elif misc_type == "array_method_clause":
            # Test use of inside operator in array method with clause
            test_logic = f"""
  // Miscellaneous test case: inside operator in array method with clause
  logic [7:0] search_value;
  logic [7:0] data_array [0:15];
  logic [7:0] filtered_queue [$];
  logic method_result;
  int found_indices [$];
  
  initial begin
    // Initialize data array
    for (int i = 0; i < 16; i++) begin
      data_array[i] = $random % 100;  // Random values 0-99
    end
    
    search_value = 8'h2A;  // 42 in decimal
    
    // Use find method with inside operator clause
    found_indices = data_array.find_index with (item inside {{40, 41, 42, 43, 44}});
    
    // Use select method with inside operator
    filtered_queue = data_array.find with (item inside {{[20:30]}});
    
    // Display results
    $display("Found indices: %p", found_indices);
    $display("Filtered values: %p", filtered_queue);
    
    method_result = (found_indices.size() > 0);
  end
"""

        elif misc_type == "function_returning_vsa":
            # Test function returning VSA in range list of inside operator
            test_logic = f"""
  // Miscellaneous test case: function returning VSA in range list
  logic [7:0] test_value;
  logic function_vsa_result;
  
  // Function that returns a queue (VSA)
  function automatic logic [7:0] [$] get_valid_values();
    logic [7:0] temp_queue [$];
    temp_queue.push_back(8'h10);
    temp_queue.push_back(8'h20);
    temp_queue.push_back(8'h30);
    temp_queue.push_back(8'h40);
    return temp_queue;
  endfunction
  
  // Function that returns a dynamic array
  function automatic logic [7:0] [] get_range_array();
    logic [7:0] temp_array [] = new[6];
    for (int i = 0; i < 6; i++) begin
      temp_array[i] = i * 8;
    end
    return temp_array;
  endfunction
  
  initial begin
    test_value = 8'h20;
  end
  
  // Test using function return value in inside operator
  always @(*) begin
    // Use function returning queue in inside operator
    function_vsa_result = (test_value inside {{get_valid_values()}});
  end
"""

        elif misc_type == "while_loop_array_slice":
            # Test inside operator in while loop condition with array slice
            test_logic = f"""
  // Miscellaneous test case: inside operator in while loop with array slice
  logic [7:0] search_array [0:31];
  logic [7:0] current_value;
  logic [7:0] target_values [0:7];
  logic [4:0] index;
  logic search_complete;
  
  initial begin
    // Initialize arrays
    for (int i = 0; i < 32; i++) begin
      search_array[i] = i + 50;
    end
    
    for (int i = 0; i < 8; i++) begin
      target_values[i] = 55 + (i * 3);  // 55, 58, 61, 64, 67, 70, 73, 76
    end
    
    index = 0;
    search_complete = 0;
    
    // While loop with inside operator condition using array slice
    while (!search_complete && index < 32) begin
      current_value = search_array[index];
      
      // Check if current value is in target slice
      if (current_value inside {{target_values[2:5]}}) begin  // Check middle slice
        $display("Found target value %d at index %d", current_value, index);
        search_complete = 1;
      end
      
      index = index + 1;
    end
  end
"""

        elif misc_type == "upward_xmr_array":
            # Test upward XMR with array in range list
            test_logic = f"""
  // Miscellaneous test case: upward XMR with array in range list
  logic [7:0] parent_array [0:7];
  logic [7:0] test_value;
  logic upward_xmr_result;
  
  // Initialize parent array
  initial begin
    for (int i = 0; i < 8; i++) begin
      parent_array[i] = i * 7;
    end
    test_value = 8'd21;  // Should match parent_array[3]
  end
  
  // Sub-module that references parent array via upward XMR
  sub_module_upward_xmr sub_inst();
  
  assign upward_xmr_result = sub_inst.upward_result;
endmodule

// Sub-module for upward XMR testing
module sub_module_upward_xmr;
  logic [7:0] local_test;
  logic upward_result;
  
  initial begin
    local_test = 8'd21;
  end
  
  // Upward XMR to access parent module's array
  always @(*) begin
    // Reference parent module's array using upward XMR
    upward_result = (local_test inside {{$parent.parent_array}});
  end
"""

        elif misc_type == "chained_function":
            # Test chained function call returning array in range list
            test_logic = f"""
  // Miscellaneous test case: chained function call returning array
  logic [7:0] test_value;
  logic chained_result;
  
  // Class with method that returns an object with array
  class DataContainer;
    logic [7:0] data_array [0:7];
    
    function new();
      for (int i = 0; i < 8; i++) begin
        data_array[i] = i * 6;
      end
    endfunction
    
    function DataContainer get_container();
      return this;
    endfunction
  endclass
  
  class DataManager;
    DataContainer container;
    
    function new();
      container = new();
    endfunction
    
    function DataContainer get_data_container();
      return container.get_container();
    endfunction
  endclass
  
  DataManager manager;
  
  initial begin
    manager = new();
    test_value = 8'd18;  // Should match data_array[3]
  end
  
  // Test chained function call in inside operator
  always @(*) begin
    // foo1.foo2() where foo1 returns class object and foo2 returns VSA
    chained_result = (test_value inside {{manager.get_data_container().data_array}});
  end
"""

        elif misc_type == "dpi_function":
            # Test inside operator in highconn of DPI function/task
            test_logic = f"""
  // Miscellaneous test case: inside operator with DPI function
  logic [7:0] test_value;
  logic [7:0] dpi_array [0:7];
  logic dpi_result;
  
  // DPI function import (for testing - may not compile without actual C code)
  import "DPI-C" function int check_value_in_c_array(input logic [7:0] value, 
                                                     input logic [7:0] c_array [0:7]);
  
  initial begin
    // Initialize array
    for (int i = 0; i < 8; i++) begin
      dpi_array[i] = i * 9;
    end
    test_value = 8'd27;  // Should match dpi_array[3]
  end
  
  // Test inside operator as argument to DPI function
  always @(*) begin
    // Pass result of inside operator to DPI function
    dpi_result = check_value_in_c_array(test_value, dpi_array) && 
                 (test_value inside {{dpi_array}});
  end
"""

        elif misc_type == "stress_large_array":
            # Test stress scenario where inside operator is used with very large array
            test_logic = f"""
  // Miscellaneous test case: stress test with very large array
  parameter int LARGE_SIZE = 1024;  // Large array size
  logic [15:0] large_array [0:LARGE_SIZE-1];
  logic [15:0] test_value;
  logic stress_result;
  logic [9:0] search_index;
  
  initial begin
    // Initialize large array with pattern
    for (int i = 0; i < LARGE_SIZE; i++) begin
      large_array[i] = i * 13 + 7;  // Some pattern
    end
    
    test_value = 16'd527;  // Should match large_array[40] = 40*13+7 = 527
    search_index = 0;
  end
  
  // Test inside operator with very large array (stress test)
  always @(*) begin
    // This tests performance and memory usage with large arrays
    stress_result = (test_value inside {{large_array}});
  end
  
  // Additional stress test with slicing large array
  logic stress_slice_result;
  always @(*) begin
    // Test with large array slice
    stress_slice_result = (test_value inside {{large_array[100:199]}});
  end
"""

        elif misc_type == "class_static_array":
            # Test class static member (array) in range list
            test_logic = f"""
  // Miscellaneous test case: class static member array in range list
  logic [7:0] test_value;
  logic static_result;
  
  // Class with static array member
  class StaticArrayClass;
    static logic [7:0] static_array [0:15];
    static logic initialized = 0;
    
    // Static method to initialize array
    static function void init_static_array();
      if (!initialized) begin
        for (int i = 0; i < 16; i++) begin
          static_array[i] = i * 11;
        end
        initialized = 1;
      end
    endfunction
    
    // Static method to check value
    static function logic check_value(logic [7:0] val);
      return (val inside {{static_array}});
    endfunction
  endclass
  
  initial begin
    // Initialize static array
    StaticArrayClass::init_static_array();
    test_value = 8'd77;  // Should match static_array[7] = 7*11 = 77
  end
  
  // Test class static member in inside operator
  always @(*) begin
    // Access static array directly
    static_result = (test_value inside {{StaticArrayClass::static_array}});
  end
"""

        else:
            print(f"Warning: Miscellaneous type '{misc_type}' not recognized")
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
        description="Transform a file to add miscellaneous test cases for inside operator"
    )
    parser.add_argument("input_file", help="Input Verilog file")
    parser.add_argument("output_file", help="Output Verilog file")
    parser.add_argument(
        "--signal", required=True, help="Name of the signal to use in the test case"
    )
    parser.add_argument(
        "--misc-type",
        required=True,
        choices=[
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
        help="Type of miscellaneous test to perform",
    )

    args = parser.parse_args()

    # Ensure input file exists
    if not os.path.exists(args.input_file):
        print("Error: Input file '%s' not found" % args.input_file)
        return 1

    # Process the file
    success = transform_inside_op_misc(
        args.input_file, args.output_file, args.signal, args.misc_type
    )

    return 0 if success else 1


if __name__ == "__main__":
    sys.exit(main())
