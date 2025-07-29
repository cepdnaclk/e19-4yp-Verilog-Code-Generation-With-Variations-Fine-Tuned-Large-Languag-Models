#### Option 1:

```verilog
//wire [1:0] a;
//wire [1:0] b;
//wire [1:0] carry;
//wire [1:0] sum;
//wire [1:0] d;
//assign b = MULTIPLIER;
//wire [1:0] c;
//assign c = MULTIPLIER;
//assign d = a + MULTIPLIER;
//assign sum = a + b;
//assign carry = a + d;

// replace with below

reg [1:0] a;
reg [1:0] b;
reg [1:0] carry;
reg [1:0] sum;
reg [1:0] d;
assign b = MULTIPLIER;
reg [1:0] c;
assign c = MULTIPLIER;
assign d