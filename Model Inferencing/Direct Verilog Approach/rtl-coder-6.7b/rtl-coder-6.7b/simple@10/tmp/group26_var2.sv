module gade(gade_o, gade_i);
gade_if gade_o;
gade_if gade_i;
```
// Test OR gate with 3 inertial delay
or #3 (gade_o.a1, gade_i.c1, gade_i.b1);
// Test AND gate with rise=2, fall=1 inertial delay
and #(2,1) (gade_o.a, gade_i.c, gade_i.b);
endmodule
### Interface Verilog Code:
interface gade_if(input logic b,b1,c,c1);
logic a,a1;
// Test OR gate with 3 inertial delay
or #3 (a1,c1,b1);
// Test AND gate with rise=2, fall=1 inertial delay
and #(2,1) (a,c,b);
endinterface