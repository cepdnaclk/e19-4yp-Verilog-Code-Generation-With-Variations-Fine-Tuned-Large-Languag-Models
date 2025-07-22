```
module clock_gen_loop_func;
  reg clk, en;

  function [31:0] counter;
    input [31:0] n;
    counter = n;
  endfunction

  always @(posedge en)
    for (integer i=0; i<counter(100); i++) #2 clk = ~clk;

  initial
  begin
    clk = 1'b0;
    en = 1'b0;
  end
  initial $monitor("clk=%b, t=%0d, en=%b ", clk,$time,en);
endmodule
```
### Explanation:
The for loop is more concise, and a little easier to read than the for loops in the previous section.

Notice that the variable i is declared inside the for loop. Without declaring a variable inside a for loop, i would be visible outside the for loop, and it would be a compile-time error.
### Note:
Variable declarations are optional in Verilog 2001, so the loop would not have compiled in Verilog 2001.

The for loop is similar to the for loop in C or Java.

### Output:
![image](../assets/img/3218-1.png)

![image](../assets/img/3218-2.png)

#### References:
[Verilog HDL for Digital System Design](https://www.amazon.com/gp/product/9332568135/ref=dp-kindle-redirect?_encoding=UTF8&btkr=1&ref_=as_li_ss_ilink30)