module reg4(D, Clock, Resetn, Q);
input [3:0] D;
input Clock, Resetn;
output [3:0] Q;
reg [3:0] Q;

//Procedural continuous assignment
wire [3:0] w;
localparam DELAY = 0;
always @(posedge Clock or negedge Resetn)
    if (Resetn == 0)
        Q <= 4'b0000;
    else
        Q <= D;

//Added procedural assignment
assign w[4] = Q[3];
endmodule
### Expected Output:
No change in operation.
### Test Plan:
- Add the procedural assignment, and simulate in cadence with VCS.
- Verify that the operation of the module remains the same as it did in the previous tutorial on procedural continuous assignment.
- Add an additional delay assignment to the procedural continuous assignment, and simulate in cadence with VCS.
- Verify that the addition of the delay assignment causes the operation of the module to change.
### Pass/Fail Criteria:
### Pass:
- The operation of the module remains the same after procedural continuous assignment and delay is added.
### Fail:
- The operation changes after procedural continuous assignment and delay is added.
### Fail:
- The operation of the module remains the same after procedural continuous assignment and