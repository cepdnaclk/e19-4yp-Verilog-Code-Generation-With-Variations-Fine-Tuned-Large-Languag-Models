module example7_10(x1, x2, x3, Clock, f, g, h);
input x1, x2, x3, Clock;
output f, g, h;
reg f, g, h;
always @(posedge Clock)
begin
    case (x1)
        1: begin f = 1; end
        0: begin h = 1; end
    endcase
    case (x2)
        1: begin g = 1; end
        0: begin h = 1; end
    endcase
    case (x3)
        1: begin f = 1; end
        0: begin g = 1; end
    endcase
end
endmodule
### Reference:
[https://www.tutorialspoint.com/verilog/verilog\_case.htm](https://www.tutorialspoint.com/verilog/verilog_case.htm)
#

#
Module: example7_1