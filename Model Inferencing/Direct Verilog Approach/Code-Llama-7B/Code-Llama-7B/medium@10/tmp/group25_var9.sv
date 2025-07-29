module example7_8(x1, x2, Clock, f, g);
input x1, x2, Clock;
output g;
reg f, g;
wire g_wire;

always @(posedge Clock)
begin
    case (x1)
        1'b0: begin
            f = 1'b1;
            g = 1'b1;
        end
        1'b1: begin
            f = 1'b0;
            g = 1'b0;
        end
    endcase
end

assign g = g_wire;
endmodule
### 6.8.7
### Base Verilog Code:
module example7_9(x1, x2, Clock, f, g);
input x1, x2, Clock;
output f, g;
reg f, g;
always @(posedge Clock)
begin
    case (x1)
        1'b0: f = 1'b1;
        1'b1: f = 1'b0;
    endcase
    case (x2)
        1'b0: f = 1'b1;
        1'b1: f = 1'b0;
    endcase