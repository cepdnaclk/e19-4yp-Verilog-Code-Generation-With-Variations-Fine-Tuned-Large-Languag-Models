module DFFSR1(input in,input reset,output reg out);
  reg in1;
  always @* begin
    in1=in;
    out = (reset)? 1'b0 : in1;
  end
  initial begin
    out=0;
  end
endmodule

*

** DFFSR2 Module
*
### Base Verilog Code:
module DFFSR2