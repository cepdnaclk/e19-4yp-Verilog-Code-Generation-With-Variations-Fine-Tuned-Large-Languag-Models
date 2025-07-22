module dff_aa(q,qb,di,clk,clr,pr); // Behavioral DFF with async controls and conditional path delay
  output q,qb; input di,clk,clr,pr;
  reg q;
  always @(posedge clk or posedge clr or posedge pr) // Added async sensitivity
    if(clr) q <= 1'b0; // Use non-blocking <=
    else if(pr) q <= 1'b1;
    else q <= di;
  // Behavioral description with async reset/preset priority
  assign X = {4'b0, {3'b1, 1'b0}};
  specify
    // Conditional path delay: clk->q edge-sensitive path active only if clr and pr are low
    if (!clr &&!pr) (posedge clk *> (q:X)) = 1;
  endspecify
  // Behavioral description with async reset/preset priority
  specify
    // Conditional path delay: clk->q edge-sensitive path active only if clr and pr are low
    if (!clr &&!pr) (posedge clk *> (q:1'b1)) = 1;
  endspecify
  // Behavioral description with async reset/preset priority
  assign Y = {4'b0, {3'b1, 1'b0}};
  specify
    // Conditional path delay: clk->q edge-sensitive path active only if clr and pr are low
    if (!clr &&!pr) (posedge clk *> (q:Y)) = 1;
  endspecify
endmodule
### Results:
![Results](https://drive.google.com/uc?export=view&id=1-7h-1y5V9J19R6eM-94Y_yT773d-oAqd)

### Base Verilog Code:
module dff_aa(q,qb,di,clk,clr,pr); // Behavioral DFF with async controls and conditional path delay
  output q,qb; input di,clk,clr,pr;
  reg q;
  always @(posedge clk or posedge clr or posedge pr) // Added async sensitivity
    if(clr) q <= 1'b0; // Use non-blocking <=
    else if(pr) q <= 1'b1;
    else q <= di;
  // Behavioral description with async reset/preset priority
  assign X = {4'b0, {3'b1, 1'b0}};
  specify
    // Conditional path delay: clk->q edge-sensitive path active only if clr and pr are low
    if (!clr &&!pr) (posedge clk *> (q:X)) = 1;
  endspecify
  // Behavioral description with async reset/preset priority
  specify
    // Conditional path delay: clk->q edge-sensitive path active only if clr and pr are low
    if (!clr &&!pr) (posedge clk *> (q:1'b1)) = 1;
  endspecify
  // Behavioral description with async reset/preset priority
  assign Y = {4'b0, {3'b1, 1'b0}};
  specify
    // Conditional path delay: clk->q edge-sensitive path active only if clr and pr are low
    if (!clr &&!pr) (posed