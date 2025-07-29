```verilog
module mux24b(
input wire [3:0] a,
input wire [3:0] b,
input wire s,
output reg [3:0] y
);
always @(*)
if(s == 0)
y = a[1:0];
else
y = b[1:0];
endmodule
```
### Testbench:
```verilog
module mux24b_tb;

  reg [3:0] a, b;
  reg s;
  wire [3:0] y;

  mux24b m (a, b, s, y);

  initial begin
    a = 4'b0011;
    b = 4'b0101;
    s = 1'b0;
    #10 s = 1'b1;
    #10 $finish;
  end

endmodule
```
### Output:
![simoutput](Mux24b_MUX24_1.png)

### Reference:
https://www.youtube.com/watch?v=G2t1i0QgmgU&list=PLowKtXNTBypH19hNV