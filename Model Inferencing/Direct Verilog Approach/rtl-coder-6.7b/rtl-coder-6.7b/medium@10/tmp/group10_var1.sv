```
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

module reg4_dynamic(D, Clock, Resetn, Q);
input [7:0] D;
input Clock, Resetn;
output [7:0] Q;
reg [7:0] Q;

always @(posedge Clock or negedge Resetn)
    if (Resetn == 0)
        Q <= 8'b00000000;
    else
        Q <= D;
endmodule

module reg4_dynamic_assign(D, Clock, Resetn, Q);
input [7:0] D;
input Clock, Resetn;
output [7:0] Q;
reg [7:0] Q;

parameter D2 = D[1:0];

always @(posedge Clock or negedge Resetn)
    if (Resetn == 0)
        Q <= 8'b00000000;
    else
        Q[D2] <= D;
endmodule
```