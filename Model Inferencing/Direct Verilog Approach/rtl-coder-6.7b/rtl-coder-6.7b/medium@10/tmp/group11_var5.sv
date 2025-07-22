```verilog
module aoi2(a,b,c,d,g);
output reg g;
input a,b,c,d;
reg e,f;
reg[1:0] g1;
function [1:0] aoi21;
input a;
input b;
input c;
input d;
begin
aoi21 = (a&&b) || (c&&d);
end
endfunction
initial begin
g1 = aoi21(a,b,c,d);
g = ~g1; // Final AOI output
end
endmodule
```
### Output:
![output](/assets/img/verilog/aoi2.png)