module EventCtlPart (output xPart, yPart, input a, b, c);
reg xReg, yReg;
assign xPart = xReg;
assign yPart = yReg;
always @(a, b)
begin: PartList
    if(a & b){
        xReg <= c;
        if(c){
            yReg <= b & c;
        } else {
            yReg <= (!(c) &!(b));
        }
    } else {
        xReg <= b;
        yReg <= c;
    }
end
endmodule
"""

EXPECTED_OUTPUT_ERROR2 = """
module EventCtlPart (output xPart, yPart, input a, b, c);
reg xReg, yReg;
assign xPart = xReg;
assign yPart = yReg;
always @(a, b)
begin: PartList
    xReg <= a & b & c;
    yReg <= (b | c) ^ a;
end
endmodule
Add a nested if using inside with a 3D array slice selected by variable to test range inclusion.
module EventCtlPart (output xPart, yPart, input a, b, c);
reg xReg, yReg;
assign xPart = xReg;
assign yPart = yReg;
always @(a, b)
begin: PartList
    if(a & b){
        xReg <= c;
        if(c){
            yReg <= b & c;
        } else {
            yReg <= (!(c) &!(b));
        }
    } else {
        xReg <= b;
        yReg <= c;
    }
end
endmodule
"""

EXPECTED_OUTPUT_ERROR3 = """
module EventCtlPart (output xPart, yPart, input a, b, c);
reg xReg, yReg;
assign xPart = xReg;
assign yPart = yReg;
always @(a, b)
begin: PartList
    xReg <= a & b & c;
    yReg <= (b | c) ^ a;
end
endmodule
Add a nested if using inside with a 3D array slice selected by variable to test range inclusion.
module EventCtlPart (output xPart, yPart, input a, b, c);
reg xReg, yReg;
assign xPart = xReg;
assign yPart = yReg;
always @(a, b)
begin: PartList
    if(a & b){
        xReg <= c;
        if(c){
            yReg <= b & c;
        } else {
            yReg <= (!(c) &!(b));
        }
    } else {
        xReg <= b;
        yReg <= c;
    }
end
endmodule
Add a nested if using inside with a 3D array slice selected by variable to test range inclusion.
"""

TESTS = [
    (
        input_string,
        output_string,
        expected_output_error,
        True,
    ),
    (
        input_string2,
        output_string2,
        expected_output_error2,
        True,
    ),
    (
        input_string3,
        output_string3,
        expected_output_error3,
        True,
    ),
    (
        input_string_error,
        output_string_error,
        expected_output,
        True,
    ),
    (
        input_string_error2,
        output_string_error2,
        expected_output_error,
        True,
    ),
    (
        input_string_error3,
        output_string_error3,
        expected_output_error3,
        True,
    ),
]
/pydactyl/helpers.py
import re
from.config import CONFIG
from.patterns import PATTERNS, PATTERNS_ERROR
from.utils import *

def is_instruction_code(code):
    output = ""
    code_lines = code.split("\n")

    for line in code_lines:
        if re.match(r"\s*module.*", line):
            return True
        else:
            continue
        
    return False


def handle_instruction(code):
    lines = code.split("\n")
    for line in lines:
        if line.startswith("### ") and line.endswith(" ###"):
            return line[4:-4]
        else:
            continue
    return False


def handle_input(code):
    lines = code.split("\n")
    for line in lines:
        if line.startswith("input ") and line.endswith(";"):
            return line[6:-1]
        else:
            continue
    return False


def handle_output(code):
    lines = code.split("\n")
    for line in lines:
        if line.startswith("output ") and line.endswith(";"):
            return line[7:-1]
        else:
            continue
    return False


def handle_always(code):
    lines = code.split("\n")
    for line in lines:
        if line.startswith("always @("):
            return line[9:]
        else:
            continue
    return False


def handle_nested_if(code):
    lines = code.split("\n")
    for line in lines:
        if line.startswith("if("):
            return line[3:]
        else:
            continue
    return False


def handle_begin(code):
    lines = code.split("\n")
    for line in lines:
        if line.startswith("begin:"):
            return line[6:]
        else:
            continue
    return False


def handle_end(code):
    lines = code.split("\n")
    for line in lines:
        if line.startswith("end:"):
            return line[4:]
        else:
            continue
    return False


def handle_assign(code):
    lines = code.split("\n")
    for line in lines:
        if line.startswith("assign ") and line.endswith(";"):
            return line[7:-1]
        else:
            continue
    return False


def handle_always_code(code):
    lines = code.split("\n")
    if len(lines) > 1:
        for line in lines[1:]:
            if line.startswith("    ") and line.endswith(";"):
                return line[4:-1]
            else:
                continue
    return False


def handle_always_code_error(code):
    lines = code.split("\n")
    if len(lines) > 1:
        for line in lines[1:]:
            if line.startswith("    ") and (line.endswith(";") or re.match(PATTERNS_ERROR, line)):
                return line[4:]
            else:
                continue
    return False


def handle_always_code_error2(code):
    lines = code.split("\n")
    if len(lines) > 1:
        for line in lines[1:]:
            if line.startswith("    ") and (line.endswith(";") or re.match(PATTERNS_ERROR, line)) and re.match(r"begin.*end", line):