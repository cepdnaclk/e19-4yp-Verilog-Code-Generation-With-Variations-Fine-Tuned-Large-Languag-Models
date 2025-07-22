create a module with one input and one output that can behave like a wire:
module wire_assign( input in, output out );
    assign out = in;
endmodule
### Original Test:
test_wire_assign
### Test Description:
This test instantiates the wire_assign module, and uses a netlist from the library to test the module's behavior.
The wire module is expected to assign its output value to its input value.
```
# 8.4. test_assign: Design System Test Assignments

## Purpose:
This test case verifies that the assign operator in design system correctly assigns a net from one netlist to another.

## Test Description:
In this test, a top module is instantiated using the netlist from the library, and the assign operator assigns a net from one netlist to another.

## Expected Result:
The test expects the assignment operator to set the value of the net on the right hand side to the value of the net on the left hand side after each clock cycle, and it expects the output of the top module to match the value of the net on the right hand side after 2 clock cycles.

## Observed Result:
The test does not pass the expected result.

## Test Code:
[Design System Test Assignments](https://bitbucket.org/cadence_test/design_system_tests/src/master/test_cases/assign_test_cases/)

# 2.4. test_wire_assign: Design System Test Wire Assignments

## Purpose:
This test case verifies that the assign operator in design system assigns the value of an input net to another output net.

## Test Description:
In this test, a top module is instantiated using the netlist from the library, and the assign operator assigns a value to the output net from the input net.

## Expected Result:
The test expects the assign operator to set the value of the net on the right hand side to the value of the net on the left hand side after each clock cycle, and it expects the output of the top module to match the value of the net on the right hand side after 2 clock cycles.

## Observed Result:
The output of the top module does not match the value of the net on the right hand side after 2 clock cycles.

## Test Code:
[Design System Test Wire Assignments](https://bitbucket.org/cadence_test/design_system_tests/src/master/test_cases/wire_assign_test_cases/)

# 4.11. test_delay_assign: Design System Test Delays Assignments

## Purpose:
This test case verifies that the assign operator in design system correctly assigns a net from one netlist to another using the delay modifier.

## Test Description:
In this test, a top module is instantiated using the netlist from the library, and the assign operator assigns a net from one netlist to another.

## Expected Result:
The test expects the assignment operator to set the value of the net on the right hand side to the value of the net on the left hand side after each clock cycle, and it expects the output of the top module to match the value of the net on the right hand side after 2 clock cycles.

## Observed Result:
The test does not pass the expected result.

## Test Code:
[Design System Test Delays Assignments](https://bitbucket.org/cadence_test/design_system_tests/src/master/test_cases/delay_assign_test_cases/)

# 4.10. test_sync_assign: Design System Test Sync Assignments

## Purpose:
This test case verifies that the assign operator in design system correctly assigns a net from one netlist to another.

## Test Description:
In this test, a top module is instantiated using the netlist from the library, and the assign operator assigns a net from one netlist to another.

## Expected Result:
The test expects the assignment operator to set the value of the net on the right hand side to the value of the net on the left hand side after each clock cycle, and it expects the output of the top module to match the value of the net on the right hand side after 2 clock cycles.

## Observed Result:
The test does not pass the expected result.

## Test Code:
[Design System Test Sync Assignments](https://bitbucket.org/cadence_test/design_system_tests/src/master/test_cases/sync_assign_test_cases/)

# 4.5. test_sync_assign_with_delay: Design System Test Delayed Assignments

## Purpose:
This test case verifies that the assign operator in design system correctly assigns a net from one netlist to another using the delay modifier.

## Test Description:
In this test, a top module is instantiated using the netlist from the library, and the assign operator assigns a net from one netlist to another.

## Expected Result:
The test expects the assignment operator to set the value of the net on the right hand side to the value of the net on the left hand side after each clock cycle, and it expects the output of the top module to match the value of the net on the right hand side after 2 clock cycles.

## Observed Result:
The test does not pass the expected result.

## Test Code:
[Design System Test Delayed Assignments](https://bitbucket.org/cadence_test/design_system_tests/src/master/test_cases/sync_assign_delay_test_cases/)

# 3.3. test_bit_assign: Design System Test Bit Assignments

## Purpose:
This test case verifies that the assign operator in design system assigns a net from one netlist to another.

## Test Description:
In this test, a top module is instantiated using the netlist from the library, and the assign operator assigns a net from one netlist to another.

## Expected Result:
The test expects the assignment operator to set the value of the net on the right hand side to the value of the net on the left hand side after each clock cycle, and it expects the output of the top module to match the value of the net on the right hand side after 2 clock cycles.

## Observed Result:
The test does not pass the expected result.

## Test Code:
[Design System Test Bit Assignments](https://bitbucket.org/cadence_test/design_system_tests/src/master/test_cases/bit_assign_test_cases/)

# 1.14. test_wire_assign_with_delay: Design System Test Delayed Assignments

## Purpose:
This test case verifies that the assign operator in design system correctly assigns a net from one netlist to another using the delay modifier.

## Test Description:
In this test, a top module is instantiated using the netlist from the library, and the assign operator assigns a net from one netlist to another.

## Expected Result:
The test expects the assignment operator to set the value of the net on the right hand side to the value of the net on the left hand side after each clock cycle, and it expects the output of the top module to match the value of the net on the right hand side after 2 clock cycles.

## Observed Result:
The test does not pass the expected result.

## Test Code:
[Design System Test Delayed Assignments](https://bitbucket.org/cadence_test/design_system_tests/src/master/test_cases/wire_assign_delay_test_cases/)

# 6.3. test_bit_assign_with_delay: Design System Test Delayed Assignments

## Purpose:
This test case verifies that the assign operator in design system correctly assigns a net from one netlist to another using the delay modifier.

## Test Description:
In this test, a top module is instantiated using the netlist from the library, and the assign operator assigns a net from one netlist to another.

## Expected Result:
The test expects the assignment operator to set the value of the net on the right hand side to the value of the net on the left hand side after each clock cycle,