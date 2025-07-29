```verilog
module comp
(input wire [N-1:0] x,
input wire [N-1:0] y,
output reg gt, // Greater than
output reg eq, // Equal
output reg lt // Less than
);

// Function that returns the sign of x
function int s(reg [N-1:0] x);
  if(x[N-1] == 1'b1)
    s = -1;
  else
    s = 1;
endfunction

// Combinational logic
always @(*)
begin
  // Default outputs to 0
  gt = 1'b0;
  eq = 1'b0;
  lt = 1'b0;
  // Set flags based on comparison results
  if(s(x) > s(y)) // Sign of x is greater than sign of y
    gt = 1'b1;
  if(s(x) == s(y)) // Sign of x is equal to sign of y
    eq = 1'b1;
  if(s(x) < s(y)) // Sign of x is less than sign of y
    lt = 1'b1;
end
```

### Final Code:

```verilog
module comp
(input wire [N-1:0] x,
input wire [N-1:0] y,
output reg gt, // Greater than
output reg eq, // Equal
output reg lt // Less than
);

// Function that returns the sign of x
function int s(reg [N-1:0] x);
  if(x[N-1] == 1'b1)
    s = -1;
  else
    s = 1;
endfunction

// Combinational logic
always @(*)
begin
  // Default outputs to 0
  gt = 1'b0;
  eq = 1'b0;
  lt = 1'b0;
  // Set flags based on comparison results
  case(s(x))
    -1:
      case(s(y))
        1:
          gt =