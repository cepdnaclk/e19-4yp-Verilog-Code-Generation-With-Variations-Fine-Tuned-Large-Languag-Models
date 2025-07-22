module reg4(D,Clock,Resetn,Q);
input [3:0] D;
input Clock;
input Resetn;
output [3:0] Q;
reg [3:0] Q;
wire [2:0] index;
assign index = 2;
always @(posedge Clock or negedge Resetn)
    if (Resetn == 0)
        Q <= 4'b0000;
    else
        Q[index] <= D;
endmodule
### Verilog HDL Code:
module reg4(D,Clock,Resetn,Q);
input [3:0] D;
input Clock;
input Resetn;
output [3:0] Q;
reg [3:0] Q;
always @(posedge Clock or negedge Resetn)
    if (Resetn == 0)
        Q <= 4'b0000;
    else
        Q[D] <= D;
endmodule