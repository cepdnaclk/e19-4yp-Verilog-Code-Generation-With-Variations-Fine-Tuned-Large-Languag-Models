struct {
  bit [7:0] DataIn;
  bit [7:0] DataOut;
  bit ControlSignals;
} Variation;
module DataComponent (Variation.DataIn, Variation.DataOut, Variation.ControlSignals);
input [7:0] Variation.DataIn;
output [7:0] Variation.DataOut;
input Variation.ControlSignals;
endmodule
### Verification Code:
reg [7:0] expected_DataIn;
reg [7:0] expected_DataOut;
reg expected_ControlSignals;