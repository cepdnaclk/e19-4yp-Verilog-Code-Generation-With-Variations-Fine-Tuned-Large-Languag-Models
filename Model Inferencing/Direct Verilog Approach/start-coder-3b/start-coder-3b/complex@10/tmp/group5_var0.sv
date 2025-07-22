```python
class table_driven:
    def __init__(self):
        self.fsm_name = "table_driven"

    def get_fsm_code(self):
        fsm_code = ""
        fsm_code += self.fsm_name + ":\n"
        fsm_code += "    input Clock, Resetn, w;\n"
        fsm_code += "    output z;\n"
        fsm_code += "    reg y, Y, z;\n"
        fsm_code += "    parameter A = 0, B = 1;\n"
        fsm_code += "    always @(w or y)\n"
        fsm_code += "        case (y)\n"
        fsm_code += "            A: if (w)\n"
        fsm_code += "                begin\n"
        fsm_code += "                    z = 0;\n"
        fsm_code += "                    Y = B;\n"
        fsm_code += "                end\n"
        fsm_code += "            else\n"
        fsm_code += "                begin\n"
        fsm_code += "                    z = 0;\n"
        fsm_code += "                    Y = A;\n"
        fsm_code += "                end\n"
        fsm_code += "            B: if (w)\n"
        fsm_code += "                begin\n"
        fsm_code += "                    z = 1;\n"
        fsm_code += "                    Y = B;\n"
        fsm_code += "                end\n"
        fsm_code += "            else\n"
        fsm_code += "                begin\n"
        fsm_code += "                    z = 0;\n"
        fsm_code += "                    Y = A;\n"
        fsm_code += "                end\n"
        fsm_code += "    endcase\n"
        fsm_code += "    always @(negedge Resetn or posedge Clock)\n"
        fsm_code += "        if (Resetn == 0) y <= A;\n"
        fsm_code += "        else y <= Y;\n"
        return fsm_code
```
### Generated FSM Code:
```
table_driven:
    input Clock, Resetn, w;
    output z;
    reg y, Y, z;
    parameter A = 0, B = 1;
    always @(w or y)
        case (y)
            A: if (w)
                begin
                    z = 0;
                    Y = B;
                end
            else
                begin
                    z = 0;
                    Y = A;
                end
            B: if (w)
                begin
                    z = 1;
                    Y = B;
                end
            else
                begin
                    z = 0;
                    Y = A;
                end
    endcase
    always @(negedge Resetn or posedge Clock)
        if (Resetn == 0) y <= A;
        else y <= Y;
```
### Verilog Code:
```
module table_driven(Clock, Resetn, w, z);
    input Clock, Resetn, w;
    output z;
    reg y, Y, z;
    parameter A = 0, B = 1;
    always @(w or y)
        case (y)
            A: if (w)
                begin
                    z = 0;
                    Y = B;
                end
            else
                begin
                    z = 0;
                    Y = A;
                end
            B: if (w)
                begin
                    z = 1;
                    Y = B;
                end
            else
                begin
                    z = 0;
                    Y = A;
                end
    endcase
    always @(negedge Resetn or posedge Clock)
        if (Resetn == 0) y <= A;
        else y <= Y;
endmodule
```

## Moore FSM
### Base Verilog Code:
module moore(Clock, Resetn, w, z);
input Clock, Resetn, w;
output z;
reg y, Y, z;
parameter A = 0, B = 1;
always @(w or y)
case (y)
A: if (w)
    z = 0;
else
    z = 0;