module dff_aa(q,qb,di,clk,clr,pr); // Behavioral DFF with async controls and conditional path delay
  output q,qb; input di,clk,clr,pr;
  reg q;
  reg [1:0] b [1:0]; // New module scope declaration of a 2x2 bit array
  reg [1:0] x, y;    // New module scope declaration of two bits
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
  // Declare X and Y in the module scope array using array indexing
  assign x = b[0]; // x=b[0][1:0]
  assign y = b[1]; // y=b[1][1:0]
endmodule