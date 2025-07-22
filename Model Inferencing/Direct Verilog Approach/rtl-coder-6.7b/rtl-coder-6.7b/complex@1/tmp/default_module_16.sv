module tb_TOP1;
  reg CLK, RST_X;
  reg [3:0] x;
  TOP1 uut(.CLK(CLK),.RST_X(RST_X),.x(x));

  initial begin
    CLK = 0;
    forever #5 CLK = ~CLK;
  end

  initial begin
    RST_X = 0; #10;
    RST_X = 1;
    #10;
    x = 4'b0001; #10;
    x = 4'b0010; #10;
    x = 4'b0100; #10;
    x = 4'b1000; #10;
    x = 4'b0000; #10;
  end
endmodule
### Expected Results:
The simulation should succeed, and the behavior should be identical to the expected behavior in Part 1.

### Solution:
```verilog
// Top-level module declaration
module TOP1(
  input CLK, // Clock input
  input RST_X, // Reset input
  input [3:0] x
);
  // Package declaration for constant array
  package arrayPkg;
    parameter arrayP [3:0] = '{1, 2, 3, 4};
  endpackage

  // Comparator logic with inside operator
  always @(posedge CLK) begin
    if (RST_X) begin
      // Reset logic
      $display("Resetting...");
    end
    else begin
      // Comparator logic
      if (x inside {arrayPkg::arrayP}) begin
        $display("x inside arrayPkg::arrayP");
      end
      else begin
        $display("x outside arrayPkg::arrayP");
      end
    end
  end
endmodule
// Testbench module declaration
module tb_TOP1;
  reg CLK, RST_X;
  reg [3:0] x;
  TOP1 uut(.CLK(CLK),.RST_X(RST_X),.x(x));

  initial begin
    CLK = 0;
    forever #5 CLK = ~CLK;
  end

  initial begin
    RST_X = 0; #10;
    RST_X = 1;
    #10;
    x = 4'b0001; #10;
    x = 4'b0010; #10;
    x = 4'b0100; #10;
    x = 4'b1000; #10;
    x = 4'b0000; #10;
  end
endmodule
```

### Results:
```verilog
x inside arrayPkg::arrayP
x inside arrayPkg::arrayP
x inside arrayPkg::arrayP
x inside arrayPkg::arrayP
x outside arrayPkg::arrayP
```