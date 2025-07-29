module wire_assign_mod( input clk[8], output out );
    // assign out to clk[*]
    assign out = clk[*];
endmodule
"""

import sys
import re

def check_test_cases(test_cases, verbose):
    return_code = 0
    for test_case in test_cases:
        test_name = test_case[0]
        expected_output = test_case[1]
        actual_output = test_case[2]
        if expected_output == actual_output:
            if verbose:
                print("Test Passed: " + test_name)
        else:
            print("Test Failed:\n" + test_name)
            print("Expected Output: \n" + expected_output)
            print("Actual Output: \n" + actual_output)
            return_code = 1
    return return_code

def main(argv):
    verbose = False
    test_cases = [
        ["Input_01", "Module instantiated with a wildcard index.", "Module instantiated with a wildcard index."],
        ["Input_02", "Module instantiated with a wildcard index.", "Module instantiated with a wildcard index."],
        ["Input_03", "Module instantiated with a wildcard index.", "Module instantiated with a wildcard index."],
        ["Input_04", "Module instantiated with a wildcard index.", "Module instantiated with a wildcard index."],
        ["Input_05", "Module instantiated with a wildcard index.", "Module instantiated with a wildcard index."],
        ["Input_06", "Module instantiated with a wildcard index.", "Module instantiated with a wildcard index."],
        ["Input_07", "Module instantiated with a wildcard index.", "Module instantiated with a wildcard index."],
        ["Input_08", "Module instantiated with a wildcard index.", "Module instantiated with a wildcard index."],
        ["Input_09", "Module instantiated with a wildcard index.", "Module instantiated with a wildcard index."],
        ["Input_10", "Module instantiated with a wildcard index.",