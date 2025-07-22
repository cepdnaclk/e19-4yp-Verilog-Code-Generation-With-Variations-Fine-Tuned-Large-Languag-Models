#!/bin/bash
# Test script for PyVerilog-based transformations

# Make sure the transformation scripts are executable
chmod +x reg_to_wire_xform.py
chmod +x module_name_xform.py

# Make sure PyVerilog is installed
pip3 install pyverilog

# Display the original file
echo "Original file content:"
echo "======================"
cat simple_counter.v
echo ""

# Test 1: Run reg_to_wire transformation for a specific variable
echo "Test 1: Running reg_to_wire transformation for variable 'count'..."
python3 reg_to_wire_xform.py simple_counter.v simple_counter_wire.v --variable count
echo ""

# Display the transformed file
echo "Transformed file content:"
echo "========================="
cat simple_counter_wire.v
echo ""

# Test 2: Run module_name transformation
echo "Test 2: Running module_name transformation..."
python3 module_name_xform.py simple_counter.v simple_counter_renamed.v --from simple_counter --to advanced_counter
echo ""

# Display the transformed file
echo "Transformed file content:"
echo "========================="
cat simple_counter_renamed.v
echo ""

# Test 3: Run both transformations in sequence using a chain
echo "Test 3: Running both transformations using a chain..."
python3 reg_to_wire_xform.py simple_counter.v temp.v
python3 module_name_xform.py temp.v simple_counter_both.v --from simple_counter --to advanced_counter
rm temp.v
echo ""

# Display the transformed file
echo "Transformed file with both changes:"
echo "=================================="
cat simple_counter_both.v