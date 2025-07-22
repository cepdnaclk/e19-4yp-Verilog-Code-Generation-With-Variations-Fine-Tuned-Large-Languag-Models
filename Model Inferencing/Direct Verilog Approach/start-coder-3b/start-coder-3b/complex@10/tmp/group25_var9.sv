```verilog
module linear_repeater(in_rand, out_rand);
input [4:0] in_rand;
output [4:0] out_rand;
rand begin
out_rand = in_rand;
end
endmodule
```
## Question 7: Parity Generator
### Base Verilog Code:
```verilog
module parity(in, out);