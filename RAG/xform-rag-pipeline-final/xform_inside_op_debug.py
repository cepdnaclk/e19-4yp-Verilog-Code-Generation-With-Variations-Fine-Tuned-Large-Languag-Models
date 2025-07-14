#!/usr/bin/env python3
"""
Transformation to create test cases for debugging and tool-specific scenarios
of the inside operator. This includes Verdi debugging, tracing, and other
EDA tool specific test cases.
"""

import sys
import os
import re
import argparse
from pyverilog.vparser.parser import parse
from pyverilog.vparser.ast import *


class InsideOpDebugVisitor:
    """
    AST visitor that identifies modules to add inside operator debug test cases.
    """

    def __init__(self, signal_name, debug_type):
        """
        Initialize the visitor.

        Args:
            signal_name (str): Name of the signal to use in the test case
            debug_type (str): Type of debug test to perform
        """
        self.signal_name = signal_name
        self.debug_type = debug_type
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
                            "Added debug test case for inside operator: %s"
                            % (self.debug_type)
                        )

            # Visit children
            for c in node.children():
                self.visit(c)


def transform_inside_op_debug(input_file, output_file, signal_name, debug_type):
    """
    Transform a file to add debug test cases for inside operator.

    Args:
        input_file (str): Path to input Verilog file
        output_file (str): Path to output Verilog file
        signal_name (str): Name of the signal to use in the test case
        debug_type (str): Type of debug test to perform

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
        visitor = InsideOpDebugVisitor(signal_name, debug_type)
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

        # Based on the debug_type, determine what test to add
        if debug_type == "value_annotation":
            # Test for value annotation in source window (Verdi debugging)
            test_logic = f"""
  // Debug test case: check for value annotation in source window
  logic [7:0] debug_test_value;
  logic [7:0] annotation_array [0:15];
  logic annotation_result;
  logic [7:0] traced_signal;
  
  initial begin
    // Initialize array for debugging
    for (int i = 0; i < 16; i++) begin
      annotation_array[i] = i * 8;
    end
    debug_test_value = 8'h40;  // 64 in decimal, should match annotation_array[8]
  end
  
  // This signal will be traced and annotated in Verdi
  assign traced_signal = debug_test_value;
  
  // Inside operator that can be observed in value annotation
  always @(*) begin
    // This result should be visible in Verdi's source window with value annotation
    annotation_result = (debug_test_value inside {{annotation_array}});
  end
  
  // Additional debug signals for observation
  logic step_by_step_result;
  always @(*) begin
    // Break down the inside operation for easier debugging
    step_by_step_result = 1'b0;
    for (int i = 0; i < 16; i++) begin
      if (debug_test_value == annotation_array[i]) begin
        step_by_step_result = 1'b1;
      end
    end
  end
"""

        elif debug_type == "trace_driver_load":
            # Test trace driver and load functionality
            test_logic = f"""
  // Debug test case: trace driver and load
  logic [7:0] driver_test_value;
  logic [7:0] load_array [0:7];
  logic driver_result;
  logic load_result;
  
  // Driver signals that can be traced
  logic [7:0] driver_signal_1, driver_signal_2;
  logic [7:0] load_signal_1, load_signal_2;
  
  initial begin
    // Initialize arrays
    for (int i = 0; i < 8; i++) begin
      load_array[i] = i * 5;
    end
    driver_test_value = 8'd15;  // Should match load_array[3]
  end
  
  // Driver logic - these signals drive other signals
  assign driver_signal_1 = driver_test_value;
  assign driver_signal_2 = driver_test_value + 8'd10;
  
  // Load logic - these signals are loaded by drivers
  assign load_signal_1 = driver_signal_1;
  assign load_signal_2 = driver_signal_2;
  
  // Inside operators that involve driver/load relationships
  always @(*) begin
    // Driver result - trace how this drives other logic
    driver_result = (driver_signal_1 inside {{load_array}});
    
    // Load result - trace what loads this
    load_result = (load_signal_2 inside {{8'd20, 8'd25, 8'd30, 8'd35}});
  end
  
  // Additional hierarchical signals for driver/load tracing
  wire [7:0] hierarchical_driver = driver_signal_1;
  wire hierarchical_load_result = (hierarchical_driver inside {{load_array}});
"""

        elif debug_type == "scountdriver":
            # Test scountdriver functionality (signal count driver)
            test_logic = f"""
  // Debug test case: scountdriver - count signal drivers
  logic [7:0] count_test_value;
  logic [7:0] multi_driver_signal;
  logic [7:0] single_driver_signal;
  logic [7:0] driver_array [0:7];
  logic count_result_multi, count_result_single;
  
  // Multiple drivers for multi_driver_signal (potential conflict)
  logic driver_enable_1, driver_enable_2, driver_enable_3;
  
  initial begin
    // Initialize
    for (int i = 0; i < 8; i++) begin
      driver_array[i] = i * 3;
    end
    count_test_value = 8'd12;  // Should match driver_array[4]
    
    // Enable different drivers at different times
    driver_enable_1 = 1'b1;
    driver_enable_2 = 1'b0;
    driver_enable_3 = 1'b0;
    
    #10 driver_enable_1 = 1'b0; driver_enable_2 = 1'b1;
    #10 driver_enable_2 = 1'b0; driver_enable_3 = 1'b1;
  end
  
  // Multiple drivers (for scountdriver analysis)
  assign multi_driver_signal = driver_enable_1 ? count_test_value : 8'hZZ;
  assign multi_driver_signal = driver_enable_2 ? (count_test_value + 8'd5) : 8'hZZ;
  assign multi_driver_signal = driver_enable_3 ? (count_test_value - 8'd2) : 8'hZZ;
  
  // Single driver
  assign single_driver_signal = count_test_value;
  
  // Inside operators with different driver counts
  always @(*) begin
    // Test with multi-driver signal
    count_result_multi = (multi_driver_signal inside {{driver_array}});
    
    // Test with single-driver signal
    count_result_single = (single_driver_signal inside {{driver_array}});
  end
"""

        elif debug_type == "shdl_xmr_force":
            # Test SHDL XMR force functionality
            test_logic = f"""
  // Debug test case: SHDL XMR force
  logic [7:0] force_test_value;
  logic [7:0] force_array [0:7];
  logic force_result;
  logic forced_signal;
  
  // Sub-module for XMR force testing
  force_sub_module force_sub_inst();
  
  initial begin
    // Initialize array
    for (int i = 0; i < 8; i++) begin
      force_array[i] = i * 7;
    end
    force_test_value = 8'd21;  // Should match force_array[3]
  end
  
  // Signal that can be forced via XMR
  assign forced_signal = force_test_value;
  
  // Inside operator with signal that might be forced
  always @(*) begin
    force_result = (forced_signal inside {{force_array}});
  end
  
  // XMR access to sub-module signal
  logic xmr_force_result;
  always @(*) begin
    xmr_force_result = (force_sub_inst.sub_signal inside {{force_array}});
  end
  
  // Force scenario simulation
  initial begin
    #20;
    // Simulate force command: force forced_signal = 8'd14;
    // This would be done externally via SHDL XMR force
    $display("Time %t: forced_signal = %h, force_result = %b", 
             $time, forced_signal, force_result);
    
    #20;
    // Simulate release: release forced_signal;
    $display("Time %t: After release - forced_signal = %h, force_result = %b", 
             $time, forced_signal, force_result);
  end
endmodule

// Sub-module for force testing
module force_sub_module;
  logic [7:0] sub_signal;
  logic [7:0] sub_array [0:3];
  
  initial begin
    sub_signal = 8'h2A;
    sub_array = '{{8'h10, 8'h20, 8'h2A, 8'h30}};
  end
"""
            # Note: For this case, we need to modify the entire content structure
            modified_content = module_content + test_logic

        elif debug_type == "ucli_trace":
            # Test UCLI command - trace driver/load
            test_logic = f"""
  // Debug test case: UCLI command - trace driver/load
  logic [7:0] ucli_test_value;
  logic [7:0] trace_array [0:7];
  logic ucli_result;
  
  // Signals for UCLI tracing
  logic [7:0] trace_driver_sig;
  logic [7:0] trace_load_sig_1, trace_load_sig_2;
  
  initial begin
    // Initialize for UCLI tracing
    for (int i = 0; i < 8; i++) begin
      trace_array[i] = i * 6;
    end
    ucli_test_value = 8'd18;  // Should match trace_array[3]
  end
  
  // Driver that can be traced with UCLI
  assign trace_driver_sig = ucli_test_value;
  
  // Loads that can be traced with UCLI
  assign trace_load_sig_1 = trace_driver_sig;
  assign trace_load_sig_2 = trace_driver_sig + 8'd5;
  
  // Inside operator for UCLI tracing
  always @(*) begin
    ucli_result = (trace_driver_sig inside {{trace_array}});
  end
  
  // Additional logic for comprehensive tracing
  logic ucli_intermediate_result;
  always @(*) begin
    ucli_intermediate_result = (trace_load_sig_1 inside {{trace_array}}) || 
                              (trace_load_sig_2 inside {{8'd20, 8'd23, 8'd25}});
  end
  
  // UCLI trace commands that could be used:
  // trace -driver trace_driver_sig
  // trace -load trace_load_sig_1
  // trace -driver ucli_result
"""

        elif debug_type == "ucli_vpi_walkers":
            # Test running tests with UCLI/VPI walkers
            test_logic = f"""
  // Debug test case: Run tests with UCLI/VPI walkers
  logic [7:0] walker_test_value;
  logic [7:0] walker_array [0:15];
  logic walker_result;
  
  // VPI accessible signals
  logic [7:0] vpi_signal_1, vpi_signal_2, vpi_signal_3;
  logic [3:0] vpi_counter;
  
  initial begin
    // Initialize for VPI walker testing
    for (int i = 0; i < 16; i++) begin
      walker_array[i] = $random % 100;  // Random values for walker testing
    end
    walker_test_value = 8'd42;
    vpi_counter = 4'h0;
  end
  
  // VPI accessible logic
  assign vpi_signal_1 = walker_test_value;
  assign vpi_signal_2 = walker_test_value << 1;
  assign vpi_signal_3 = walker_test_value >> 1;
  
  // Inside operator that VPI walkers can analyze
  always @(*) begin
    walker_result = (vpi_signal_1 inside {{walker_array}});
  end
  
  // Test logic that VPI walkers can traverse
  always @(posedge clk) begin
    if (rst) begin
      vpi_counter <= 4'h0;
    end else begin
      vpi_counter <= vpi_counter + 1;
      
      // Dynamic inside operation that walkers can observe
      if (vpi_counter inside {{4'h5, 4'h7, 4'h9, 4'hB}}) begin
        walker_test_value <= walker_test_value + 8'd1;
      end
    end
  end
  
  // Hierarchical structure for VPI walker navigation
  walker_sub_module walker_sub();
  
  // VPI walker accessible properties
  property vpi_inside_property;
    @(posedge clk) (walker_result == 1'b1) |-> (vpi_signal_1 inside {{walker_array}});
  endproperty
  
  vpi_inside_assert: assert property(vpi_inside_property);
endmodule

// Sub-module for VPI walker hierarchy testing
module walker_sub_module;
  logic [7:0] sub_walker_signal;
  logic [7:0] sub_walker_array [0:7];
  logic sub_walker_result;
  
  initial begin
    for (int i = 0; i < 8; i++) begin
      sub_walker_array[i] = i * 9;
    end
    sub_walker_signal = 8'd27;  // Should match sub_walker_array[3]
  end
  
  always @(*) begin
    sub_walker_result = (sub_walker_signal inside {{sub_walker_array}});
  end
"""
            # Note: For this case, we need to modify the entire content structure
            modified_content = module_content + test_logic

        else:
            print(f"Warning: Debug type '{debug_type}' not recognized")
            return False

        # For cases that don't modify the entire structure, add before endmodule
        if debug_type not in ["shdl_xmr_force", "ucli_vpi_walkers"]:
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
        description="Transform a file to add debug test cases for inside operator"
    )
    parser.add_argument("input_file", help="Input Verilog file")
    parser.add_argument("output_file", help="Output Verilog file")
    parser.add_argument(
        "--signal", required=True, help="Name of the signal to use in the test case"
    )
    parser.add_argument(
        "--debug-type",
        required=True,
        choices=[
            "value_annotation",
            "trace_driver_load",
            "scountdriver",
            "shdl_xmr_force",
            "ucli_trace",
            "ucli_vpi_walkers",
        ],
        help="Type of debug test to perform",
    )

    args = parser.parse_args()

    # Ensure input file exists
    if not os.path.exists(args.input_file):
        print("Error: Input file '%s' not found" % args.input_file)
        return 1

    # Process the file
    success = transform_inside_op_debug(
        args.input_file, args.output_file, args.signal, args.debug_type
    )

    return 0 if success else 1


if __name__ == "__main__":
    sys.exit(main())
