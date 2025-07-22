```
module addern(carryin, data, S, carryout);
parameter n = 16;
input carryin;
input [n-1:0] data;
output [n-1:0] S;
output carryout;
reg [n-1:0] S;
reg [n:0] C;
integer k;
reg carryout;
array inside [0:n-1] inside_array;
process(data)
begin
   C[0] = carryin;
   for (k = 0; k <= n-1; k = k + 1)
   begin
      inside_array[k] = data[k];
   end
   for (k = n-1; k >= 0; k = k - 1)
   begin
       S[k] = inside_array[k] ^ C[k];
       C[k+1] = (inside_array[k] & C[k]) | (C[k] & inside_array[k]) | (C[k] & C[k]);
   end
   carryout = C[n];
end
endmodule
```

## In summary:
* `inside` operator uses different type of syntaxes to apply to different types of object.
* `inside` operator can be used to apply `inside` operator to different types of signals.


# References:
* [Inside operator Verilog](https://www.edaplayground.com/x/f21)
* [Inside operator Verilog](https://www.edaplayground.com/x/f6)
* [Inside operator Verilog](https://www.edaplayground.com/x/fL)
* [Inside operator Verilog](https://www.edaplayground.com/x/U)
* [Inside operator Verilog](https://www.edaplayground.com/x/V)
* [Inside operator Verilog](https://www.edaplayground.com/x/a9)
* [Inside operator Verilog](https://www.edaplayground.com/x/7fR)
* [Inside operator Verilog](https://www.edaplayground.com/x/85b)
* [Inside operator Verilog](https://www.edaplayground.com/x/85b)
* [Inside operator Verilog](https://www.edaplayground.com/x/85b)
* [Inside operator Verilog](https://www.edaplayground.com/x/85b)
* [Inside operator Verilog](https://www.edaplayground.com/x/85b)
* [Inside operator Verilog](https://www.edaplayground.com/x/2dC)
* [Inside operator Verilog](https://www.edaplayground.com/x/7fR)
* [Inside operator Verilog](https://www.edaplayground.com/x/63)
* [Inside operator Verilog](https://www.edaplayground.com/x/85b)
* [Inside operator Verilog](https://www.edaplayground.com/x/85b)
* [Inside operator Verilog](https://www.edaplayground.com/x/85b)
* [Inside operator Verilog](https://www.edaplayground.com/x/85b)
* [Inside operator Verilog](https://www.edaplayground.com/x/85b)
* [Inside operator Verilog](https://www.edaplayground.com/x/85b)
* [Inside operator Verilog](https://www.edaplayground.com/x/85b)
* [Inside operator Verilog](https://www.edaplayground.com/x/85b)
* [Inside operator Verilog](https://www.edaplayground.com/x/85b)
* [Inside operator Verilog](https://www.edaplayground.com/x/85b)
* [Inside operator Verilog](https://www.edaplayground.com/x/85b)
* [Inside operator Verilog](https://www.edaplayground.com/x/85b)
* [Inside operator Verilog](https://www.edaplayground.com/x/85b)
* [Inside operator Verilog](https://www.edaplayground.com/x/85b)
* [Inside operator Verilog](https://www.edaplayground.com/x/85b)
* [Inside operator Verilog](https://www.edaplayground.com/x/85b)
* [Inside operator Verilog](https://www.edaplayground.com/x/85b)
* [Inside operator Verilog](https://www.edaplayground.com/x/85b)
* [Inside operator Verilog](https://www.edaplayground.com/x/85b)
* [Inside operator Verilog](https://www.edaplayground.com/x/85b)
* [Inside operator Verilog](https://www.edaplayground.com/x/85b)
* [Inside operator Verilog](https://www.edaplayground.com/x/85b)
* [Inside operator Verilog](https://www.edaplayground.com/x/85b)
* [Inside operator Verilog](https://www.edaplayground.com/x/85b)
* [Inside operator Verilog](https://www.edaplayground.com/x/85b)
* [Inside operator Verilog](https://www.edaplayground.com/x/85b)
* [Inside operator Verilog](https://www.edaplayground.com/x/85b)
* [Inside operator Verilog](https://www.edaplayground.com/x/85b)
* [Inside operator Verilog](https://www.edaplayground.com/x/85b)
* [Inside operator Verilog](https://www.edaplayground.com/x/85b)
* [Inside operator Verilog](https://www.edaplayground.