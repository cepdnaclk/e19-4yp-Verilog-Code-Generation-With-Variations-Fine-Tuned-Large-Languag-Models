```
module dff_aa(q,qb,di,clk,clr,pr); // Behavioral DFF with async controls and conditional path delay
  output q,qb; input di,clk,clr,pr;
  reg [3:0] X;
  reg [3:0] Y;
  assign X = {1'b0,di,1'b0};
  assign Y = {{1'b0,1'b0,1'b0,1'b0},{1'b0,1'b0,1'b0,1'b0}};
  reg q;
  assign qb=~q;
  specify
    // Conditional path delay: clk->q edge-sensitive path active only if clr and pr are low
    if (!clr &&!pr) (posedge clk *> (q:di)) = 1;
  endspecify
  // Behavioral description with async reset/preset priority
  always @(posedge clk or posedge clr or posedge pr) // Added async sensitivity
    if(clr) q <= 1'b0; // Use non-blocking <=
    else if(pr) q <= 1'b1;
    else q <= di;
endmodule
```
### Faults:
The following faults are generated when checking the code for the `inside` fault violations.
#### Misdiagnosed Faults:
The fault type of `inside` is reported as a misdiagnosed fault.
![misdiagnosed-fault](https://github.com/lakshitajain25/Fault-Diagnoser-in-SystemVerilog/assets/72113406/cc5a641c-c904-4bc1-8f14-a45432704163)
#### False Positive Faults:
The following faults are false positives that are reported as false positives.
![false-positive-fault](https://github.com/lakshitajain25/Fault-Diagnoser-in-SystemVerilog/assets/72113