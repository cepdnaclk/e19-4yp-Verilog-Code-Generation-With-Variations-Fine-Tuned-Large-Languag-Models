module dff_aa(q,qb,di,clk,clr,pr); // Behavioral DFF with async controls and conditional path delay

  output q,qb; input di,clk,clr,pr;

  reg [1:0] X[3];
  reg [1:0] Y[3];
  assign q = Y[X[1]][X[2]];
  assign qb = ~q;
  specify
    // Conditional path delay: clk->q edge-sensitive path active only if clr and pr are low
    if (!clr &&!pr) (posedge clk *> (q:di)) = 1;
  endspecify
  // Behavioral description with async reset/preset priority
  always @(posedge clk or posedge clr or posedge pr) // Added async sensitivity
    if(clr) begin
      X[1] <= 2'b00;
      X[2] <= 2'b00;
      X[3] <= 2'b00;
      Y[1] <= 2'b00;
      Y[2] <= 2'b00;
      Y[3] <= 2'b00;
    end else if(pr) begin
      X[1] <= 2'b01;
      X[2] <= 2'b0;
      X[3] <= 2'b0;
      Y[1] <= 2'b10;
      Y[2] <= 2'b01;
      Y[3] <= 2'b00;
    end else begin
      X[1] <= 2'b00;
      X[2] <= 2'b00;
      X[3] <= 2'b0;
      Y[1] <= 2'b00;
      Y[2] <= 2'b00;
      Y[3] <= 2'b00;
    end
    // check if `X[2]` is inside the packed slice
    if (inside(X[2], 2'b000, 2