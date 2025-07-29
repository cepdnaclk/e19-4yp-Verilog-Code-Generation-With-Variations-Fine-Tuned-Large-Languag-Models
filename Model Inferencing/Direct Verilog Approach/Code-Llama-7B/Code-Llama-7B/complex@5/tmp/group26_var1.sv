```
module JerkyComparator
  (output [1:0] AdjustFreq, input ClockIn, PLLClock, Reset);

  reg [1:0] Adjr;
  assign AdjustFreq = Adjr;
  reg [1:0] Hi