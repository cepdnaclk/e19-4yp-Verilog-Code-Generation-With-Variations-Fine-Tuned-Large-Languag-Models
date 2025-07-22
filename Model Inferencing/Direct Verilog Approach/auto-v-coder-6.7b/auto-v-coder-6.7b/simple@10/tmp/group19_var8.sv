```verilog
module dff_inst#(parameter width = 1) (D, Clock, Resetn, Q);
input [width-1:0] D;
input Clock, Resetn;
output reg [width-1:0] Q;

always @(posedge Clock or negedge Resetn)
  if (!Resetn)
    Q <= {width{1'b0}};
  else
    Q <= D;

endmodule


module tb();
reg [3:0] D;
reg Clock, Resetn;
wire [3:0] Q;

dff_inst #(.width(4)) dff(.D(D),.Clock(Clock),.Resetn(Resetn),.Q(Q));

initial begin
  Resetn = 1'b0;
  #5;
  Resetn = 1'b1;
  #5;
  D = 4'b1010;
  #5;
  D = 4'b0101;
  #5;
  D = 4'b1100;
  #5;
  $finish;
end

always begin
  Clock = 1'b0;
  #5;
  Clock = 1'b1;
  #10;
end

always @(posedge Clock) $display("Q = %b", Q);

initial begin
  $dumpfile("dump.vcd");
  $dumpvars(1, tb);
end

endmodule
```
This testbench creates a 4-bit Dynamic Flip-Flop (dff_inst) with dynamic width. It then generates an input operand array D and simulates the clock cycle. The results are printed to the standard output. The testbench also dumps the waveforms.

To modify the testbench to include dynamic arrays as inputs, you may need to modify the module declaration, or create a separate module to handle dynamic arrays. This is beyond the scope of this question as the problem statement does not specify the nature of the dynamic array. Please provide more details for a better solution.

**Note: This code assumes you're using Icarus Verilog or similar tool