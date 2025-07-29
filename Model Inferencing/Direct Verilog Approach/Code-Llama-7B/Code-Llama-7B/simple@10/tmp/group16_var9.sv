module orfr_tst(out); // Testbench for OR gate with force/release
  reg [31:0] b,c; wire [31:0] a;
  initial begin b=1'b0; c=1'b0; #20 $stop; end // Initialize inputs
  always #3 c = ~c; // Toggle input 'c' every 3 time units
  or_fr_rl dd(a,b,c); // Instantiate the module containing force/release
endmodule
module or_fr_rl(dataOut,dataIn); // OR with force/release
  parameter IN1_W = 32;
  parameter DATA_W = 32;
  parameter STR_LEN = 32;
  parameter UL_LEN = 32;
  localparam ST_LEN = STR_LEN + UL_LEN + 1;
  localparam OUT_W = DATA_W + ST_LEN;
  reg [IN1_W-1:0] dataIn[0:1];
  wire [OUT_W-1:0] dataOut;
  always @(dataIn[0], dataIn[1]) begin
    dataOut = dataIn[0] | dataIn[1];
  end
  always @(dataOut) begin
    dataOut[OUT_W] = "1";
  end
endmodule
### Simulation Result:

>
simulator: ModelSim 10.4c
sources: orfr_tst.v;
compile: orfr_tst.v -o orfr_tst.v.exe;
simulate: orfr_tst.v.exe;
###
**Warning: (vsim-3032) Data types and data sizes do not match.
  The value on the left is of type 'int' and the value on the
  right is of type'struct'.
###

sources: orfr_tst.v;
compile: orfr_tst.v -o orfr_tst.v.exe;
simulate: orfr_tst.v.exe;
###
**Warning: (vsim