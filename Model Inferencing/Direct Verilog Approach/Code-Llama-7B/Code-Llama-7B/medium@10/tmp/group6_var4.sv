```
module clock_gen_forever (
  input clk,
  outpout en,
  input en_init, 
  input [4:0] period
);
  wire en;
  always @(posedge en) // Start clock generation on posedge en
    forever #2 clk = ~clk; // Toggle clock every 2 time units forever
  // Initialize en and period

  initial begin
    en = en_init;
    clk = 1'b0; // Initialize clock
    $display("en is %b",en);
    $display("period is %b",period);
  end
  // Initialize en and period

  function [4:0] n_period (input [4:0] value);
    n_period = period/value;
  endfunction

  initial
  begin
    en = 0; // Start disabled
    for (int i = 1; i <= n_period(2); i++) begin // Toggle clock for 
      #2 en = ~en; // Toggle clock for n_period units
    end
  end
  // Initialize en and period

```
### Experiment Results:
```
en is 1
period is 30
clk=0, t=0, en=0
clk=1, t=2, en=0
clk=0, t=4, en=0
clk=1, t=6, en=0
clk=0, t=8, en=0
clk=1, t=10, en=0
clk=0, t=12, en=0
clk=1, t=14, en=0
clk=0, t=16, en=0
clk=1, t=18, en=0
clk=0, t=20, en=1
clk=1, t=22, en=1
clk=0, t=24, en=1
clk=1, t=26, en=1
clk=0, t=28, en=1
clk=1, t=30, en=1
clk=0, t=32, en=1
clk=1, t=34, en=1
clk=0, t=36, en=1
clk=1, t=38, en=1
clk=0, t=40, en=1
clk=1, t=42, en=1
clk=0, t=44, en=1
clk=1, t=46, en=1
clk=0, t=48, en=1
clk=1, t=50, en=1
clk=0, t=52, en=1
clk=1, t=54, en=1
clk=0, t=56, en=1
clk=1, t=58, en=1
clk=0, t=60, en=1
clk=1, t=62, en=1
clk=0, t=64, en=1
clk=1, t=66, en=1
clk=0, t=68, en=1
clk=1, t=70, en=1
clk=0, t=72, en=1
clk=1, t=74, en=1
clk=0, t=76, en=1
clk=1, t=78, en=1
clk=0, t=80, en=1
clk=1, t=82, en=1
clk=0, t=84, en=1
clk=1, t=86, en=1
clk=0, t=88, en=1
clk=1, t=90, en=1
clk=0, t=92, en=1
clk=1, t=94, en=1
clk=0, t=96, en=1
clk=1, t=98, en=1
clk=0, t=100, en=1
clk=1, t=102, en=1
clk=0, t=104, en=1
clk=1, t=106, en=1
clk=0, t=108, en=1
clk=1, t=110, en=1
clk=0, t=1