```verilog
module Johnson_Counter (count, enable, clock, reset);
output [3: 0] count;
input enable;
input clock, reset;
reg [3: 0] count;

always @ (posedge clock, posedge reset)
if (reset == 1'b1) count <= 4'b0000;
else if (enable) begin
  case (count)
    4'b0000: count <= 4'b0001;
    4'b0001: count <= 4'b0011;
    4'b0011: count <= 4'b0111;
    4'b0111: count <= 4'b1111;
    4'b1111: count <= 4'b1110;
    4'b1110: count <= 4'b1100;
    4'b1100: count <= 4'b1000;
    default: count <= 4'b0000;
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

initial begin
  reset = 1;
  enable = 0;
  #10 reset = 0;
  enable = 1;
  #1000;
  $finish;
end

endmodule
```
This code creates a Johnson counter that toggles each bit in the count on a clock rising edge. It also includes an initial block to set the reset, enable, and finish the simulation after a certain number of time steps. The Johnson counter is reset before the enable is activated, and the simulation finishes after a certain number of steps. The `enable` signal is used to trigger the count to update. 

Note: For Verilog simulation, please ensure the timescale is defined at the top of the design file. This code should be used in a verilog simulation environment.### Instruction:

You can