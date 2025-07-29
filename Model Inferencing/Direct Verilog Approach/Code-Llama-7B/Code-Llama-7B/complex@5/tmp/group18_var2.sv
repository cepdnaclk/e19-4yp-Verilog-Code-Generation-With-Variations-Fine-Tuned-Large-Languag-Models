module DFF_AA(q1,q2,q3,di,clk,clr,pr); // Behavioral DFF with async controls and conditional path delay
  output [2:0] q1,q2,q3; output [2:0] qb; input [3:0] di,clk,clr,pr;
  reg [2:0] Q; wire [2:0] Y_COND;
  specify
    // Conditional path delay: clk->q edge-sensitive path active only if clr and pr are low
    if (!clr &&!pr) (posedge clk *> (q:di)) = 1;
  endspecify
  // Behavioral description with async reset/preset priority
  always @(posedge clk or posedge clr or posedge pr) // Added async sensitivity
    if(clr) q <= 3'b0; // Use non-blocking <=
    else if(pr) q <= 3'b1;
    else q <= di;
  assign {Y_COND} = inside({4'b1100,Y}, {6'b001100,6'b110011}); // inside check
endmodule
### Variation Instruction: