module example7_5(x1, x2, x3, Clock, f, g);
input x1, x2, x3, Clock;
output f, g;
reg f, g;
always @(posedge Clock)
begin
    case (x1)
        1'b1: f = x2 & x1;
        1'b0: g = 0;
     endcase
end
endmodule
### Explanation Code:
The following code fragment illustrates the use of case statement to build a multiplexer. 
### Verilog Code Explanation:
    case (x1)
        1'b1: f = x2 & x1;
        1'b0: g = 0;
    endcase
This statement checks the value of x1. If x1=1'b1 (i.e., the value is 1) then f is assigned the value of x2. 
If x1=1'b0 (i.e., the value is 0) then f is assigned the value of 0, which is equivalent to g.