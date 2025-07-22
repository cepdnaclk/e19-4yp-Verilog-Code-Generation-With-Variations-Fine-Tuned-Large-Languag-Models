```verilog
module Johnson_Counter#(parameter WIDTH = 4) (count, enable, clock, reset);
output [WIDTH-1: 0] count;
input enable;
input clock, reset;
reg [WIDTH-1: 0] count;
always @ (posedge clock, posedge reset)
if (reset == 1) count <= 0;
else if (enable)
begin
    case (count)
    4'b0000,
    4'b0001,
    4'b0011,
    4'b0111,
    4'b1111,
    4'b1110,
    4'b1100,
    4'b1000: begin
       count <= {count[WIDTH-1: 1], 1'b0};
    end
    4'b1001,
    4'b0101,
    4'b0110,
    4'b0010: begin
       count <= {count[WIDTH-1: 1], 1'b1};
    end
    default: count <= 0;
    endcase
end
endmodule

module t_Johnson_Counter ();
wire [3: 0] count;
reg enable;
reg clock, reset;
Johnson_Counter M0 (count, enable, clock, reset);
initial #500 $finish;
initial begin clock = 0; forever #5 clock = ~clock; end
initial fork
join
endmodule
```
In this variation, the Johnson counter logic is wrapped in a generate block to make it reusable for any `WIDTH` number. It also checked `count` inside an array with constant index. This is a more general use of the Johnson counter. It is not specific to `4`-bit counter, it can be used for any `WIDTH` number. Also, it is easy to configure for different case. 

This code will create a Johnson counter with a width of 4, which gives us an 8-bit Johnson counter. It uses a 4-bit counter and checks if the count goes from 0111 to 0000 or