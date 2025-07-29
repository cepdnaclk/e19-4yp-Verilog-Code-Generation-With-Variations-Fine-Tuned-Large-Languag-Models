module alu_test (
  input wire [7:0] a,
  input wire [7:0] b,
  output wire [7:0] result,
  output reg [3:0] flags,
  input wire [1:0] alu_op
) ;

  reg [7:0] carry, overflow, zero, sign, add, sub;
  reg [7:0] a_abs, b_abs, sum, diff;
  reg [7:0] temp_abs;
  reg [7:0] temp_sum, temp_diff;

  /* ADC */
  always @(*) begin
    temp_abs = a_abs;
    temp_sum = sum;
    if (overflow) temp_sum = temp_abs + temp_abs + 1'b1;
    if (carry) temp_sum = carry + temp_abs;

    result = temp_sum;
  end

  /* ABS */
  always @* begin
    a_abs = (a[7] == 1'b1)? -a : a;
    b_abs = (b[7] == 1'b1)? -b : b;

    sum = a_abs + b_abs;
    diff = a_abs - b_abs;

    zero = (sum == 0);
    sign = (sum[7] == 1'b1);
    overflow = (a[7] == 1'b1 && b[7] == 1'b1 && (temp_sum[7] == 0 || temp_sum[7] == 1));
  end

  /* ADD */
  always @(a, b, alu_op) begin
    add = a + b;
    carry = (add == 8'b10000000);
    overflow = (a[7] == b[7] && a[7] == 1'b1 && (add[7] == 0 || add[7] == 1));
  end

  /* SUB */
  always @(a, b, alu_op) begin
    sub = a - b;
    carry = (