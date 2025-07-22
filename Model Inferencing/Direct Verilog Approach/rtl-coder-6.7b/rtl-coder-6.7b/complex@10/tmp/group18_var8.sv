module dff_aa(q,qb,di,clk,clr,pr); // Behavioral DFF with async controls and conditional path delay
  output q,qb; input di,clk,clr,pr;
  reg q;
  assign qb=~q;
  wire X; // Sliced value
  wire Y; // Expression value
  assign X=q; // Packed slice of q to be compared with y
  assign Y=di | clr | pr; // Expression value
  specify
    // Conditional path delay: clk->q edge-sensitive path active only if clr and pr are low
    if (!clr &&!pr)  (posedge clk *> (q:di)) = 1;
  endspecify
  // Behavioral description with async reset/preset priority
  always @(posedge clk or posedge clr or posedge pr) // Added async sensitivity
    if(clr) q <= 1'b0; // Use non-blocking <=
    else if(pr) q <= 1'b1;
    else q <= di;
endmodule
### Testbench:
`include "dff_aatest.v" // Include file with test vectors for DFF
### Testbench Code
// Testbench for dff_aa
module dff_aatest;
  reg clk,clr,pr;
  reg [1:0]di;
  wire [1:0]q,qb;
  // Instantiate DUT with 100 ns clock period
  dff_aa DUT(.di,.clk,.clr,.pr,.q,.qb);
  initial  // Initial block with parameterized clock with 10ns period
    forever #10 clk=~clk; // Single clock
  // Test stimulus
  initial begin
    $monitor("clk=%b di=%b clr=%b pr=%b q=%b qb=%b", /*clk,*/di,clr,pr,q,qb);
    #0 clr=1; pr=0; // Async reset takes precedence
    #0 di=2