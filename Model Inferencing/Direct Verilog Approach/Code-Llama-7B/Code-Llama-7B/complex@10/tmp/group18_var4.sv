module dff_aa_var(q,qb,di,clk,clr,pr);
  parameter WIDTH=8; // Size of the arrays on which to check a result
  input [WIDTH-1:0] di;
  output [WIDTH-1:0] q,qb;
  input clk,clr,pr;
  reg [WIDTH-1:0] q;
  assign qb = ~q;
  // Declare two packed arrays
  bit [WIDTH-1:0] X, Y;
  // Verify that a result lies inside a packed slice using "inside"
  always @(posedge clk or posedge clr or posedge pr)
    if (clr) q <= 0;
    else if (pr) q <= {WIDTH{1'b1}};
    else if (inside(q,X[WIDTH-1:0],Y[WIDTH-1:0])) q <= di;
endmodule
### Results:
**SV-Unit Result:**
```

    ==========================================
    INITIAL SIMULATION COMPLETED SUCCESSFULLY.
    ==========================================

    =============================
    RUNNING TOP-LEVEL SIMULATION.
    =============================
    ----------------------------
    RUNNING SIMULATION FOR TOP-LEVEL SCOPE: /tb_top
    ----------------------------
    ===========
    SIMULATION 0
    ===========
    ----------------------------
    RUNNING SIMULATION FOR TOP-LEVEL SCOPE: /tb_top
    ----------------------------
    ---------------------------
    END SIMULATION FOR TOP-LEVEL SCOPE: /tb_top
    ---------------------------
    -------------------------
    SIMULATION COMPLETED 0
    -------------------------
    --------------------------------------------------------------------------------
    Verification result: 1/1 tests passed.
    --------------------------------------------------------------------------------
    --------------------------------------------------
    TOP-LEVEL SIMULATION COMPLETED SUCCESSFULLY.
    --------------------------------------------------
```