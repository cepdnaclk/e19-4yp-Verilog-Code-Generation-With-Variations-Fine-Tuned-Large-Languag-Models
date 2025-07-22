// Create a module with one input and one output that behaves like a wire
module wire_assign( bit in, output out );
    // assign out to in
    assign out = in;
endmodule
### Error Message:
ERROR:Fatal: [VRFC 10-038] Port direction is not consistent : wire_assign.
ERROR:Fatal: [VRFC 10-042] Unmatched parentheses within net declaration : wire_assign.
### Pass/Fail Criteria:
Module passes if no errors are reported.
### Files Submitted:
One or more SystemVerilog source files that contain the module declaration.
### Tests Performed:
The test bench should be used to verify the error message.
### Additional Information:
N/A