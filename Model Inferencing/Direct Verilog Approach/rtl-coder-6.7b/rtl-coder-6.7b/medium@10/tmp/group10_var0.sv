module reg4(D, Clock, Resetn, Q);
input [3:0] D;
input Clock, Resetn;
output [3:0] Q;
reg [3:0] Q;
always @(posedge Clock or negedge Resetn)
    if (Resetn == 0)
        Q <= 4'b0000;
    else
        Q <= D;
endmodule
### Instruction:
Add a procedural continuous assignment using inside with a dynamic array selected via variable index.
### Variation Code:
module reg4(D, Clock, Resetn, Q, sel);
input [3:0] D;
input [3:0] sel;
input Clock, Resetn;
output [3:0] Q;
reg [3:0] Q;
always @(posedge Clock or negedge Resetn)
    if (Resetn == 0)
        Q <= 4'b0000;
    else
        Q[sel] <= D;
endmodule
### Instruction:
Remove procedural continuous assignments that are safe to remove.
### Variation Code:
module reg4(D, Clock, Resetn, Q);
input [3:0] D;
input Clock, Resetn;
output [3:0] Q;
reg [3:0] Q;
always @(posedge Clock or negedge Resetn)
    if (Resetn == 0)
        Q <= 4'b0000;
    else
        Q <= D;
endmodule