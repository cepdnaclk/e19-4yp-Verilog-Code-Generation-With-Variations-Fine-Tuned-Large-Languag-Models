module example7_9(x1, x2, x3, Clock, f, g);
input x1, x2, x3, Clock;
output f, g;
reg f, g;
always @(posedge Clock or posedge x1 or posedge x2)
begin
    case (x3)
        2'b10: begin
            f = 1'b1;
            g = 1'b1;
        end
        2'b01: begin
            f = 1'b1;
            g = 1'b0;
        end
        2'bx: begin
            f = 1'b0;
            g = 1'b1;
        end
    endcase
end
endmodule
### Simulation Results:
<img src="https://github.com/AmitKumarYadav7/Digital-Design-Using-Verilog/blob/master/Lab