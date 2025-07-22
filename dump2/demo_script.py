#!/usr/bin/env python3
"""
Demonstration script for using Verilog xforms.
This script shows how to apply different transformations to the example Verilog file.
"""

import os
import sys
import subprocess


def create_directory(dir_name):
    """Create a directory if it doesn't exist."""
    if not os.path.exists(dir_name):
        os.makedirs(dir_name)
    return os.path.abspath(dir_name)


def main():
    # Create output directory
    output_dir = create_directory("xform_outputs")

    # Define paths
    verilog_file = "example.v"

    # Check if example.v exists, if not write the example to disk
    if not os.path.exists(verilog_file):
        print(f"Creating example Verilog file: {verilog_file}")
        with open(verilog_file, "w") as f:
            f.write(EXAMPLE_VERILOG)

    # Define transformations to apply
    xforms = [
        {
            "name": "parameter_scaling",
            "all": True,
            "output": os.path.join(output_dir, "parameter_scaling_all.v"),
            "description": "Scale all parameter values",
        },
        {
            "name": "parameter_scaling",
            "all": False,
            "seed": 42,
            "output": os.path.join(output_dir, "parameter_scaling_random.v"),
            "description": "Randomly scale some parameter values",
        },
        {
            "name": "move_ports_to_interface",
            "all": False,
            "seed": 42,
            "output": os.path.join(output_dir, "move_ports_to_interface.v"),
            "description": "Move some ports to an interface",
        },
        {
            "name": "move_state_to_task",
            "all": False,
            "seed": 42,
            "output": os.path.join(output_dir, "move_state_to_task.v"),
            "description": "Move state machine logic to a task",
        },
    ]

    # Apply transformations
    for xform in xforms:
        print(f"\n=== Applying transformation: {xform['description']} ===")

        # Use 'python' instead of 'python3' for Windows compatibility
        cmd = [
            "python",
            "verilog_xforms.py",
            verilog_file,
            "--output",
            xform["output"],
            "--xform",
            xform["name"],
        ]

        if xform.get("all", False):
            cmd.append("--all")

        if "seed" in xform:
            cmd.extend(["--seed", str(xform["seed"])])

        print(f"Running command: {' '.join(cmd)}")

        try:
            subprocess.run(cmd, check=True)
            print(
                f"Transformation applied successfully. Output written to {xform['output']}"
            )
        except subprocess.CalledProcessError as e:
            print(f"Error applying transformation: {e}")

    print(
        "\nAll transformations completed. Output files are in the 'xform_outputs' directory."
    )


# Example Verilog code - same as in the previous artifact
EXAMPLE_VERILOG = """module testmodule (
    input wire clk,
    input wire rst_n,
    input wire [31:0] data_in,
    output reg [31:0] data_out,
    output wire valid_out
);
    // Parameter declarations
    parameter SCALE_FACTOR = 15; // Using integer instead of real (scaled by 10)
    parameter THRESHOLD = 20;    // Using integer instead of real (scaled by 10)
    
    // Internal signals
    reg [31:0] counter;
    reg valid;
    reg [31:0] accumulator;
    reg [31:0] temp_value;
    
    // Assign outputs
    assign valid_out = valid;
    
    // Main process
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            // Reset state
            counter <= 32'h0;
            data_out <= 32'h0;
            valid <= 1'b0;
            accumulator <= 0;
            temp_value <= 0;
        end else begin
            // Increment counter
            counter <= counter + 1;
            
            // State machine
            if (counter == 0) begin
                // Initialize
                valid <= 1'b0;
                accumulator <= SCALE_FACTOR;
                temp_value <= (data_in * SCALE_FACTOR) / 10; // Scaling applied
            end else if (counter == 1) begin
                // Process data
                if (temp_value > THRESHOLD) begin
                    accumulator <= accumulator + temp_value;
                end
                valid <= 1'b1;
            end else if (counter == 2) begin
                // Output results
                data_out <= accumulator;
                counter <= 0;
            end
        end
    end
    
    // Internal computation function - using integer math instead of real
    function [31:0] compute_scale;
        input [31:0] value;
        begin
            compute_scale = (value * SCALE_FACTOR) / 10;
        end
    endfunction
    
endmodule
"""

if __name__ == "__main__":
    main()
