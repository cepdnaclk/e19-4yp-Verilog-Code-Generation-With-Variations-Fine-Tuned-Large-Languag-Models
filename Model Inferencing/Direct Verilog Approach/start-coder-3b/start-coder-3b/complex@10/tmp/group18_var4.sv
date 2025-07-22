module dff_aa(q,qb,di,clk,clr,pr); // Behavioral DFF with async controls and conditional path delay
  output q,qb; input di,clk,clr,pr;
  reg q;

  // Use a scope array to collect `X` and `Y` in module scope
  integer X[6][6][6][6]; // 1st dimension = 2^6 times 2^6 times 2^6 times 2^6
  integer Y[6][6][6][6]; // 1st dimension = 2^6 times 2^6 times 2^6 times 2^6
  integer i,j,k,l,m,n;
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

  // Pack variables in array
    for(m = 0; m <= 5; m+=1) begin
      for(n = 0; n <= 5; n+=1) begin
        for(i = 0; i <= 5; i+=1) begin
          for(j = 0; j <= 5; j+=1) begin
            for(k = 0; k <= 5; k+=1) begin
              for(l = 0; l <= 5; l+=1) begin
                $sformat(X[m][n][i][j],"%d",m*64+n*16+i*4+j) $sformat(Y[m][n][i][j],"%d",m*64+n*16+i*4+j) $sformat(X[m][n][i][j],"%d",m*64+n*16+i*4+j) $sformat(Y[m][n][i][j],"%d",m*64+n*16+i*4+j)
              end
            end
          end
        end
      end
    end
  // Evaluate X and Y
  always @* begin
    if (X[X[X[X[X[X[X[X[X[Y[Y[Y[Y[X[X[X[X[X[Y[Y[Y[Y[X[X[X[X[X[Y[Y[Y[Y[X[X[X[X[X[Y[Y[Y[Y[X[X[X[X[X[Y[Y[Y[Y[X[X[X[X[X[Y[Y[Y[Y[X[X[X[X[X[Y[Y[Y[Y[X[X[X[X[X[Y[Y[Y[Y[X[X[X[X[X[Y[Y[Y[Y[X[X[X[X[X[Y[Y[Y[Y[X[X[X[X[X[Y[Y[Y[Y[X[X[X[X[X[Y[Y[Y[Y[X[X[X[X[X[Y[Y[Y[Y[X[X[X[X[X[Y[Y[Y[Y[X[X[X[X[X[Y[Y[Y[Y[X[X[X[X[X[Y[Y[Y[Y[X[X[X[X[X[Y[Y[Y[Y[X[X[X[X[X[Y[Y[Y[Y[X[X[X[X[X[Y[Y[Y[Y[X[X[X[X[X[Y[Y[Y[Y[X[X[X[X[X[Y[Y[Y[Y[X[X[X[X[X[Y[Y[Y[Y[X[X[X[X[X[Y[Y[Y[Y[X[X[X[X[X[Y[Y[Y[Y[X[X[X[X[X[Y[Y[Y[Y[X[X[X[X[X[Y[Y[Y[Y[X[X[X[X[X[Y[Y[Y[Y[X[X[X[X[X[Y[Y[Y[Y[X[X[X[X[X[Y[Y[Y[Y[X[X[X[X[X[Y[Y[Y[Y[X[X[X[X[X[Y[Y[Y[Y[X[X[X[X[X[Y[Y[Y[Y[X[X[X[X[X[Y[Y[Y[Y[X[X[X[X[X[Y[Y[Y[Y[X[X[X[X[X[Y[Y[Y[Y[X[X[X[X[X[Y[Y[Y[Y[X[X[X[X[X[Y[Y[Y[Y[X[X[X[X[X[Y[Y[Y[Y[X[X[X[X[X[Y[Y[Y[Y[X[X[X[X[X[Y[Y[Y[Y[X[X[X[X[X[Y[Y[Y[Y[X[X[X[X[X[Y[Y[Y[Y[X[X[X[X[X[Y[Y[Y[Y[X[X[X[X[X[Y[Y[Y[Y[X[X[X[X[X[Y[Y[Y[Y[X[X[X[X[X[Y[Y[Y[Y[X[X[X[X[X[Y[Y[Y[Y[X[X[X[X[X[Y[Y[Y[Y[X[X[X[X[X[Y[Y[Y[Y[X[X[X[X[X[Y[Y[Y[Y[X[X[X[X[X[Y[Y[Y[Y[X[X[X[X[X[Y[Y[Y[Y[X[X[X[X[X[Y[Y[Y[Y[X[X[X[X[X[Y[Y[Y[Y[X[X[X[X[X[Y[Y[Y[Y[X[X[X[X[X[Y[Y[Y[Y[X[X[X[X[X[Y[Y[Y[Y[X[X[X[X[X[Y[Y[Y[Y[X[X[X[X[X[Y[Y[Y[Y[X[X[X[X[X[Y[Y[Y[Y[X[X[X[X[X[Y[Y[Y[Y[X[X[X[X[X[Y[Y[Y[Y[X[X[X[X[X[Y[Y[Y[Y[X[X[X[X[X[Y[Y[Y[Y[X[X[X[X[X[Y[Y[Y[Y[X[X[X[X[X[Y[Y[Y[Y[X[X[X[X[X[Y[Y[Y[Y[X[X[X[X[X[Y[Y[Y[Y[X[X[X[X[X[Y[Y[Y[Y[X[X[X[X[X[Y[Y[Y[Y[X[X[X[X[X[Y[Y[Y[Y[X[X[X[X[X[Y[Y[Y[Y[X[X[X[X[X[Y[Y[Y[Y[X[X[X[X[X[Y[Y[Y[Y[X[X[X[X[X[Y[Y[Y[Y[X[X[X[X[X[Y[Y[Y[Y[X[X[X[X[X[Y[Y[Y[Y[X[X[X[X[X[Y[Y[Y[Y[X[X[X[X[X[Y[Y[Y[Y[X[X[X[X[X[Y[Y[Y[Y[X[X[X[X[X[Y[Y[Y[Y[X[X[X[X[X[Y[Y[Y[Y[X[X[X[X