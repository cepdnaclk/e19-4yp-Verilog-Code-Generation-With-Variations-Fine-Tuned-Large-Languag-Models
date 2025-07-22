```
#define TCK_FREQ_KHZ (1000)

define bit is_same_input(input[31:0] left, input[31:0] right, input[1:0] op) begin
  reg[31:0] X[2];
  reg[31:0] Y[2];
  assign X[0] = left;
  assign X[1] = right;
  assign Y[0] = right;
  assign Y[1] = left;
  bit is_same = 1'b1;
  for(int i = 0; i < 2; i = i + 1) begin
    if(op == 1'b0) begin
      if(X[i] < Y[i]) begin
        is_same = 1'b0;
      end
    end else if(op == 1'b1) begin
      if(X[i] > Y[i]) begin
        is_same = 1'b0;
      end
    end else
      $error("Invalid operator.");
  end
  return is_same;
end

...

initial begin
  a = 31'h11111111111111111111111111111111;
  b = 31'h00000000000000000000000000000000;
  #((TCK_FREQ_KHZ / 1000) * 2)
end

always begin
  @(posedge TCK);

  a <= a + 1'b1;

  if(is_same_input(a, b, 1'b0)) begin
    $display("a < b");
  end else if(is_same_input(a, b, 1'b1)) begin
    $display("a > b");
  end else
    $display("Invalid operator.");
end
```
### Result:
```
Vsim>./test

=== RUN  1: 11111111111111111111111111111111, 00000000000000000000000000000000
=== RUN  2: 00000000000000000000000000000000, 11111111111111111