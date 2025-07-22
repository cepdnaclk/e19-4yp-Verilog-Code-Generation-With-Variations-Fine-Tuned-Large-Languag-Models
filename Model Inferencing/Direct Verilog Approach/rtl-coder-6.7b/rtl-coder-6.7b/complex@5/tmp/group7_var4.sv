```
module alu(s, A, B, F);
input [2:0] s;
input [3:0] A, B;
output [3:0] F;
reg [3:0] F;
wire [3:0] A_ext;
reg [3:0] const_range[7];
assign const_range = '{4'b0000,
                       4'b0001,
                       4'b0010,
                       4'b0100,
                       4'b1000,
                       4'b0111,
                       4'b1111};
always @(s or A or B)
    case (s)
        0: F = 4'b0000;
        1: F = B - A;
        2: F = A - B;
        3: F = A + B;
        4: F = A ^ B;
        5: F = A | B;
        6: F = A & B;
        7: F = 4'b1111;
    endcase
assign A_ext = A;
```
### Average Instruction Coverage:
```
Instruction coverage is 200.0000%
```
### RTL Schematic:
<img src="https://github.com/rishabh-dixit/COP3530-Digital-Systems-Design/blob/main/HW2/Q6/q6_schematic.png" width="50%" height="50%">
### Verilog RTL Schematic:
<img src="https://github.com/rishabh-dixit/COP3530-Digital-Systems-Design/blob/main/HW2/Q6/q6_rtl_schematic.png" width="50%" height="50%">