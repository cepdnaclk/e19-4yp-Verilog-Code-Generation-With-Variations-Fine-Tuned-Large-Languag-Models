```
struct packed {
  logic [3:0] data;
  string      message;
} tDataIn, tDataOut;

module or_fr_rl (output reg DataOut, input tDataIn DataIn);
  initial begin
    $monitor("Input: %b, Out: %b, %s", DataIn.data, DataOut,
      DataIn.message); // Print input and output values
  end
  always @(DataOut or DataIn.message)
    if(~DataOut && DataIn.message == "Force")
      DataOut = 1'b1;
  always @(DataOut or DataIn.message)
    if(DataOut && DataIn.message == "Release")
      DataOut = 1'b0;
endmodule

// Testbench for OR gate with force/release
module orfr_tst;
  tDataIn tb;
  tDataOut tr;
  initial begin
    tb.message = "Release";
    tb.data = 4'b0000;
    #5;
    tb.message = "Force";
    tb.data = 4'b1011;
    #5;
    tb.message = "Release";
    tb.data = 4'b1111;
    #20 $stop;
  end
  or_fr_rl dut(tr.data, tb);
endmodule
```
#### Result:
```
Input: 0000, Out: 0, Release
Input: 1011, Out: 1, Force
Input: 1111, Out: 1, Release
```
### Relevant Links:
https://www.edaplayground.com/x/Pf6V