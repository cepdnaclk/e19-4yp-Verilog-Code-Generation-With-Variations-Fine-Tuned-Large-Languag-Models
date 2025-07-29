```
module Problem1(input [3:0] a, b, output [3:0] sum);
  logic [3:0] di, clk;
  assign sum = a + b;
endmodule
```

### Testbench
```
module Problem1_tb();

  logic [3:0] sum;
  logic [3:0] a = 4’b1010;
  logic [3:0] b = 4’b0101;

  Problem1 my_module(a, b, sum);

  initial begin
    di = 1;
    #5 di = 0;
    #5 di = 1;
    #5 di = 0;
    #5 di = 1;
    #5 di = 0;
    #5 di = 1;
    #5 di = 0;
    #5 di = 1;
    #5 di = 0;
    #5 di = 1;
    #5 di = 0;
    #5 di = 1;
    #5 di = 0;
    #5 di = 1;
    #5 di = 0;
    #5 di = 1;
    #5 di = 0;
    #5 di = 1;
    #5 di = 0;
    #5 di = 1;
    #5 di = 0;
    #5 di = 1;
    #5 di = 0;
    #5 di = 1;
    #5 di = 0;
    #5 di = 1;
    #5 di = 0;
    #5 di = 1;
    #5 di = 0;
    #5 di = 1;
    #5 di = 0;
    #5 di = 1;
    #5 di = 0;
    #5 di = 1;
    #5 di = 0;
    #5 di = 1;
    #5 di = 0;
    #5 di = 1;
    #5 di = 0;
    #5 di = 1;
    #5 di = 0;