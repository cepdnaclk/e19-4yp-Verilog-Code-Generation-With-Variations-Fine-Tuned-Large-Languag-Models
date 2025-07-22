<details>
<summary>
Show B, C
</summary>

```verilog
module show_bc(ao, ai);
output ao;

input [1:0] ai;

reg [1:0] a;
reg [1:0] b;
reg [1:0] c;

reg [1:0] in;
reg [1:0] out;

// TODO: change to packed enums
// reg [1:0] enum_ai = 2'bx;
// reg [1:0] enum_ai_val;

initial begin
  a = 2'bx;
  b = 2'bx;
  c = 2'bx;

  in = {ai[1], ai[0]};
  out = {in[1], in[0]};
end

always @* begin
  // enum_ai_val = enum_ai;
  // if (enum_ai == 7'b10001001) begin
  //  enum_ai = 2'bx;
  // end
end

// TODO: implement
// always @* begin
//   c = 2'bx;
// end

always @* begin
  // if (a!= enum_ai_val) begin
  //   enum_ai_val = enum_ai;
  //   c = 2'bx;
  // end

  c = {b, c};
end