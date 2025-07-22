<code>
reg [3:0] Q [0:15];
always @(posedge Clock or negedge Resetn)
    if(Resetn == 0)
        Q <= 4'b0000;
endmodule

module reg4(D, Clock, Resetn, Q);
input [3:0] D;
input Clock, Resetn;
output [3:0] Q;
reg [3:0] Q [0:15];
always @(posedge Clock or negedge Resetn)
    if (Resetn == 0)
        Q <= 4'b0000;
    else
        Q <= D;
endmodule
### Output:
```
@N0
@N1
@N2
@N3
@N4
@N5
@N6
@N7
@N8
@N9
@N10
@N11