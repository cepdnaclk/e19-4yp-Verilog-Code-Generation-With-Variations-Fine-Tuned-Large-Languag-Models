module orfr_tst; // Testbench for OR gate with force/release
  reg d; wire a;
  typedef struct  {logic l; string s;} DataIn; // Define data type
  typedef struct  {logic l; string s;} DataOut;
  DataIn d; wire a;
  initial begin d.l=1'b0; d.s = "0"; #20 $stop; end // Initialize inputs
  always #3 d.l = ~d.l; // Toggle input 'c' every 3 time units
  or_fr_rl dd(a,d); // Instantiate the module containing force/release
endmodule
### Solution Verilog Code:
module or_fr_rl(out,in);
  input wire [0:1] in;
  output wire [0:1] out;
  always @(in) $display("@ in=%b",in);
  always @(in) begin
    #10 out = in;
    #5 $display("  => time=%t out=%b",$time,out);
  end
endmodule
### Solution TCL Code:
set in1 [top find /orfr_tb/d]
force -freeze -cancel $now $in1 'b01
### Solution Output:
@ in=b0 ##0##  => time=0 ps out=b0
@ in=b1 ##0##  => time=0 ps out=b1
@ in=b0 ##10##  => time=10 ps out=b0
@ in=b1 ##10##  => time=10 ps out=b1
@ in=b0 ##15##  => time=15 ps out=b1
@ in=b1 ##15##  => time=15 ps out=b1
### Solution Simulation:
[1] 0 ps OR ##10##(#30) -> b0
[1] 0 ps OR ##10##(#30) -> b1
[1] 10 ps OR ##10##(#30) -> b0
[1] 1