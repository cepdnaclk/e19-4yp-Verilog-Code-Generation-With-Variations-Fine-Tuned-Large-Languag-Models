module tb_TOP1;
  reg CLK, RST_X;
  TOP1 uut(.CLK(CLK),.RST_X(RST_X));

  initial begin
    CLK = 0;
    forever #5 CLK = ~CLK;
  end

  initial begin
    RST_X = 0; #10;
    RST_X = 1;
  end
endmodule

module TOP1(CLK, RST_X);
  input CLK, RST_X;

  reg [3:0] x;
  wire valid;

  reg [3:0] cmp_x [15:0] = {7, 15, 23, 31, 39, 47, 55, 63, 71, 79, 87, 95, 103, 111, 119, 127};

  always @(posedge CLK)
    if (RST_X || valid) // if x is valid, display x
      $display("x = %d", x);

  always @*
    if (inside(x, cmp_x))
      valid <= 1'b1;
    else
      valid <= 1'b0;
endmodule
### Test Results:

```
$ ghdl -r tb_TOP1 --vcd=tb_TOP1.vcd
x = 7
x = 15
x = 23
x = 31
x = 39
x = 47
x = 55
x = 63
x = 71
x = 79
x = 87
x = 95
x = 103
x = 111
x = 119
x = 127

ghdl> run 15

ghdl> waves tb_TOP1.vcd
```