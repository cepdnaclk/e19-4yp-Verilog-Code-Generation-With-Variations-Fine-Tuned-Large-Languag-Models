module reg7(D, Clock, Resetn, Q);
input [3:0] D;
input Clock, Resetn;
output [3:0] Q;
always @(posedge Clock or negedge Resetn) begin
    if (Resetn == 0) begin
        Q <= 4'b0000;
    end else begin
        Q <= D;
    end
endmodule
### Code Review:
This is a good way to make the code generic.
### Testing:
This was tested with a 4-bit register, a 5-bit register, and a 7-bit register.  All 3 have good verilog.
### Conclusion:
This is a good way to make the code generic.
### Appendix:
```
### Listing:
module reg8(D, Clock, Resetn, Q);
input [3:0] D;
input Clock, Resetn;
output [3:0] Q;
always @(posedge Clock or negedge Resetn) begin
    if (Resetn == 0) begin
        Q <= 4'b0000;
    end else if (D == 4'b0000) begin
        Q <= 4'b0001;
    end else if (D == 4'b0001) begin
        Q <= 4'b0010;
    end else if (D == 4'b0010) begin
        Q <= 4'b0011;
    end else if (D == 4'b0011) begin
        Q <= 4'b0100;
    end else if (D == 4'b0100) begin
        Q <= 4'b0101;
    end else if (D == 4'b0101) begin
        Q <= 4'b0110;
    end else if (D == 4'b0110) begin
        Q <= 4'b0111;
    end else begin
        Q <= 4'b1000;
    end
endmodule
### Result:
Verilog Code:
module reg8(D, Clock, Resetn, Q);
input [3:0] D;
input Clock, Resetn;
output [3:0] Q;
always @(posedge Clock or negedge Resetn) begin
    if (Resetn == 0) begin
        Q <= 4'b0000;
    end else if (D == 4'b0000) begin