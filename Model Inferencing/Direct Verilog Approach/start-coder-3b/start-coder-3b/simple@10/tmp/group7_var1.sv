module AndOr (output X, Y, input A, B, C);
assign #10 X = A & B;
assign #10 Y = B | C;
endmodule
### Expected Results:
X should be 4'b0010 and Y should be 4'b1110.
### Comments or rationale:
The constant was changed to 4'b1100.
/lab6/code/src/test/vunit/TestAndOr.c
// TestAndOr.c
//
// Programmer: 
// Created: 2020-09-09
// Last Modified: 2021-01-28
//
// TestAndOr.c provides C-based unit testing of the AndOr module in test/vunit/
//

#include <stdlib.h>
#include "svdpi.h"
#include "Tester.h"

// Test and verify that the AndOr module produces the correct output
void testAndOr() {
    // Module parameters
    char *outputNames[3] = {"X", "Y", NULL};
    int outputNums[2] = {1, 2};
    char *inputNames[2] = {"A", "B"};
    int inputNums[3] = {4, 4, 4};
    int outputTypes[6] = {SV_BIT, SV_BIT, SV_LOGIC, SV_LOGIC, SV_LOGIC, SV_LOGIC};
    int inputTypes[6] = {SV_BIT, SV_BIT, SV_BIT, SV_LOGIC, SV_LOGIC, SV_LOGIC};
    int clockValue = 1;
    int resetValue = 1;

    // Create test object
    Tester test;
    test.create("AndOr", outputNames, outputNums, inputNames, inputNums, outputTypes, inputTypes, 1, clockValue, resetValue);

    // Test with constant values
    test.setConstantInputValues(4);
    test.setInputValues(1, 1, 1, 1, 1, 1);
    test.runTest();

    // Generate waveform
    test.generateWaveforms();

    // Set the verilog testbench name and run the simulation
    test.setVerilogTestbenchName("AndOrTB");
    test.runSimulation();

    // Read the output values from the waveform
    test.readOutputValues();

    // Compare the values read with expected values
    test.compareOutputValues(4, 2, 4, 4, 4, 4, 4, 4, 4, 4);

    // Clean up
    test.destroy();
}

// Test and verify that the AndOr module produces the correct output with a 2-bit inputs
void testAndOr_2bit() {
    // Module parameters
    char *outputNames[3] = {"X", "Y", NULL};
    int outputNums[2] = {1, 2};
    char *inputNames[2] = {"A", "B"};
    int inputNums[3] = {2, 2, 2};
    int outputTypes[6] = {SV_BIT, SV_BIT, SV_LOGIC, SV_LOGIC, SV_LOGIC, SV_LOGIC};
    int inputTypes[6] = {SV_BIT, SV_BIT, SV_BIT, SV_LOGIC, SV_LOGIC, SV_LOGIC};
    int clockValue = 1;
    int resetValue = 1;

    // Create test object
    Tester test;
    test.create("AndOr_2bit", outputNames, outputNums, inputNames, inputNums, outputTypes, inputTypes, 1, clockValue, resetValue);

    // Test with constant values
    test.setConstantInputValues(3);
    test.setInputValues(0, 1, 1, 1, 0, 1, 0, 0, 0, 0, 1, 0, 1, 1, 0, 1);
    test.runTest();

    // Generate waveform
    test.generateWaveforms();

    // Set the verilog testbench name and run the simulation
    test.setVerilogTestbenchName("AndOrTB_2bit");
    test.runSimulation();

    // Read the output values from the waveform
    test.readOutputValues();

    // Compare the values read with expected values
    test.compareOutputValues(4, 2, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4);

    // Clean up
    test.destroy();
}

// Test and verify that the AndOr module produces the correct output with a 4-bit inputs
void testAndOr_4bit() {
    // Module parameters
    char *outputNames[3] = {"X", "Y", NULL};
    int outputNums[2] = {1, 2};
    char *inputNames[2] = {"A", "B"};
    int inputNums[3] = {4, 4, 4};
    int outputTypes[6] = {SV_BIT, SV_BIT, SV_LOGIC, SV_LOGIC, SV_LOGIC, SV_LOGIC};
    int inputTypes[6] = {SV_BIT, SV_BIT, SV_BIT, SV_LOGIC, SV_LOGIC, SV_LOGIC};
    int clockValue = 1;
    int resetValue = 1;

    // Create test object
    Tester test;
    test.create("AndOr_4bit", outputNames, outputNums, inputNames, inputNums, outputTypes, inputTypes, 1, clockValue, resetValue);

    // Test with constant values
    test.setConstantInputValues(4);
    test.setInputValues(0, 1, 0, 1, 0, 1, 1, 0, 1, 1, 1, 1, 0, 1, 1, 1);
    test.runTest();

    // Generate waveform
    test.generateWaveforms();

    // Set the verilog testbench name and run the simulation
    test.setVerilogTestbenchName("A.readOutputValues();

    // Compare the values read with expected values
    test.compareOutputValues(4, 2, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4);

    // Clean up
    test.destroy();
}

// Test and verify that the AndOr module produces the correct output with 3-input logic value
void testAndOr_3logic() {
    // Module parameters
    char *outputNames[3] = {"X", "Y", NULL};
    int outputNums[2] = {1, 2};
    char *inputNames[2] = {"A", "B"};
    int inputNums