```verilog
logic [2:0] cmp_value = 3'b101;

always_comb begin
  if (x inside cmp_value)
    y_out = 3;
  else
    y_out = 0;
end
```
### Testbench Code:
```verilog
module tb_TOP1;
  reg CLK, RST_X;
  reg [2:0] x;
  reg [2:0] y_out;
    
  TOP1 uut(.CLK(CLK),.RST_X(RST_X),.x(x),.y_out(y_out));

  initial begin
    CLK = 0;
    forever #5 CLK = ~CLK;
  end

  initial begin
    RST_X = 0; #10;
    RST_X = 1;
  end

  initial begin
    x = 0;
    #10;
    assert(y_out==0) else $error("Expected 0");
    #10;
    assert(y_out==3) else $error("Expected 3");
    x = 1;
    #10;
    assert(y_out==0) else $error("Expected 0");
    #10;
    assert(y_out==3) else $error("Expected 3");
    x = 2;
    #10;
    assert(y_out==0) else $error("Expected 0");
    #10;
    assert(y_out==3) else $error("Expected 3");
    x = 3;
    #10;
    assert(y_out==3) else $error("Expected 3");
    #10;
    assert(y_out==3) else $error("Expected 3");
    x = 4;
    #10;
    assert(y_out==3) else $error("Expected 3");
    #10;
    assert(y_out==3) else $error("Expected 3");
    x = 'x;
    #10;
    assert(y_out==3) else