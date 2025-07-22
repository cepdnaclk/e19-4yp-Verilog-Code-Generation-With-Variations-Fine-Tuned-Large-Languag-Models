module reg4(D, Clock, Resetn, Q);
input [3:0] D;
input Clock, Resetn;
output [3:0] Q;
reg [3:0] Q;
always @(posedge Clock or negedge Resetn)
    if (Resetn == 0)
        Q[0] <= D[0];
endmodule
### Result and Errors:
The output of this code is the same as the non-procedural code.

This is an example of dynamic array indexing.  The result is identical to setting Q[0] = D[0].

### Modified Verilog Code:
module reg4(D, Clock, Resetn, Q);
input [3:0] D;
input Clock, Resetn;
output [3:0] Q;
reg [3:0] Q;
always @(posedge Clock or negedge Resetn)
    if (Resetn == 0)
        Q[0] <= D;
endmodule
### Result and Errors:
The output of the modified Verilog code is the same as the non-procedural code.

An array of register does not do what you seem to expect from an array of registers.  It looks like the Verilog code behaves as if you are assigning the value of D to a single register, but you are not.

### Modified Verilog Code:
module reg4(D, Clock, Resetn, Q);
input [3:0] D;
input Clock, Resetn;
output [3:0] Q;
reg [3:0] Q;
always @(posedge Clock or negedge Resetn)
    if (Resetn == 0)
        Q <= D[0];
endmodule
### Result and Errors:
The output of the modified Verilog code is the same as the non-procedural code.

In this example, the first element of the array is being assigned to the output.

### Modified Verilog Code:
module reg4(D, Clock, Resetn, Q);
input [3:0] D;
input Clock, Resetn;
output [3:0] Q;
reg [3:0] Q[0];
always @(posedge Clock or negedge Resetn)
    if (Resetn == 0)
        Q[0] <= D[0];
endmodule
### Result and Errors:
This example generates the same Verilog code as for the previous example.  The synthesizer will generate the same RTL for this case as well.  It is an error to try and assign a value to an array.

### Modified Verilog Code:
module reg4(D, Clock, Resetn, Q);
input [3:0] D;
input Clock, Resetn;
output [3:0] Q;
reg [3:0] Q[0];
always @(posedge Clock or negedge Resetn)
    if (Resetn == 0)
        Q[3:0] <= D;
endmodule
### Result and Errors:
The output of this code is the same as the non-procedural code.

This is a dynamic array assignment.  It is synthesizable.  The result is identical to Q[0] <= D[0];

### Modified Verilog Code:
module reg4(D, Clock, Resetn, Q);
input [3:0] D;
input Clock, Resetn;
output [3:0] Q;
reg [3:0] Q[0];
always @(posedge Clock or negedge Resetn)
    if (Resetn == 0)
        Q[3:0] <= D[0];
    else
        Q[3:0] <= D[1];
endmodule
### Result and Errors:
This example generates the same RTL as the previous.  It is an error to try to assign one value to Q[0] and another to Q[1] at the same time.  The assignment to Q[0] is ignored.

### Modified Verilog Code:
module reg4(D, Clock, Resetn, Q);
input [3:0] D;
input Clock, Resetn;
output [3:0] Q;
reg [3:0] Q[0];
always @(posedge Clock or negedge Resetn)
    if (Resetn == 0)
        Q[3:0] <= D[0];
    else if (Resetn == 1)
        Q[3:0] <= D[1];
    else if (Resetn == 2)
        Q[3:0] <= D[2];
    else if (Resetn == 3)
        Q[3:0] <= D[3];
endmodule
### Result and Errors:
This Verilog generates the same Verilog code as for the previous.  The synthesizer will generate the same RTL.  The assign statements are converted to always blocks, and are placed within the sensitivity list of the always block.  We cannot use the procedural continuous assignment with conditional assignments.

### Modified Verilog Code:
module reg4(D, Clock, Resetn, Q);
input [3:0] D;
input Clock, Resetn;
output [3:0] Q;
reg [3:0] Q[0];
always @(posedge Clock or negedge Resetn)
    if (Resetn == 0)
        Q[3:0] <= D[0];
    else if (Resetn == 1)
        Q[3:0] <= D[1];
    else if (Resetn == 2)
        Q[3:0] <= D[2];
    else if (Resetn == 3)
        Q[3:0] <= D[3];
endmodule
### Result and Errors:
The output of this code is the same as the non-procedural code.  It is an error to use a procedural continuous assign within an "if" block.

### Modified Verilog Code:
module reg4(D, Clock, Resetn, Q);
input [3:0] D;