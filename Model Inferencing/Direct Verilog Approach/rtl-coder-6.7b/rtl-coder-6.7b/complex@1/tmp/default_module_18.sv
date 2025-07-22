```verilog
  // Specify conditional path delay: clk->q edge-sensitive path active only if clr and pr are low
  specify
    if (!clr &&!pr) (posedge clk *> (q:di)) = 1; // Lint error: Undefined variable 'q' used in path delay expression
  endspecify
  // Behavioral description with async reset/preset priority
  always_ff @(posedge clk or posedge clr or posedge pr) // Asynchronous reset/preset
    if(clr) q <= 1'b0; // Use non-blocking <=
    else if(pr) q <= 1'b1;
    else q <= di;
endmodule
```

### Declaration Instruction:
Declare an array of two dimensions:
```verilog
  bit [323:0][313:0] X;
```

### Array Indexed Access:
Array indexed access to a declared variable:
```verilog
  if(X[1][2]) begin
    // do something
  end
  else begin
    // do something
  end
```

### Array Element Access:
Array element access to a declared variable:
```verilog
  if(X[1][2].foo) begin
    // do something
  end
  else begin
    // do something
  end
```

### Array Shift Left:
Array shift left:
```verilog
  X[1] <<= 1;
```

### Array Shift Right:
Array shift right:
```verilog
  X[1] >>= 1;
```

### Array Bitwise Operations:
Array bitwise operations:
```verilog
  X[1] &= X[2];
  X[1] |= ~X[2];
  X[2] = ~X[1] & X[2];
```

## 6.16 2019-05-03

```verilog
// Section 6.16
// Design with conditional path delays that include unsigned integers
module dff_aa(q,qb,di,clk,clr,pr); // Behavioral DFF with async controls and conditional path delay
  output q,qb; input di,clk,clr,pr;
  reg q;
  assign qb=~q;
  // Specify conditional path delay: clk->q edge-sensitive path active only if clr and pr are low
  specify
    if (!clr &&!pr) (posedge clk *> (q:di)) = 1;
  endspecify
  // Behavioral description with async reset/preset priority
  always