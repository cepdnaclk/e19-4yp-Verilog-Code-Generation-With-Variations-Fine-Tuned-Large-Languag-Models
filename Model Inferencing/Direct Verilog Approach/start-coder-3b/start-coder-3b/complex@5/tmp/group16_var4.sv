```
`include "config.vh"
module TOP1(CLK, RST_X);
  parameter NUM_BIT = 3;
  typedef int[NUM_BIT] int_t;
  typedef int[2][NUM_BIT] comp_t;
  comp_t cmp;
  cmp = {{'b