module top(input wire CLK, input wire [4:0] X0, input wire [4:0] X1, reg [4:0] M0, reg [4:0] M1, reg [4:0] Y0, reg [4:0] Y1, reg [4:0] Z0, reg [4:0] Z1);
	comp C0(CLK,X0,M0,Y0,Z0);
	comp C1(CLK,X1,M1,Y1,Z1);
endmodule
### Comments:

This is the base Verilog code that is modified.
With this code I went for a `genvar` because the array indexes needed to be assigned the result of a function call.
It's an alternative to a function call in place of the array indexes.

<p style="page-break-after: always;">&nbsp;</p>

<a name="module_13"></a>
### Module 13:

```
module top(input wire CLK, input wire [4:0] X0, input wire [4:0] X1, reg [4:0] M0, reg [4:0] M1, reg [4:0] Y0, reg [4:0] Y1, reg [4:0] Z0, reg [4:0] Z1);
	comp C0(CLK,X0,M0,Y0,Z0);
	comp C1(CLK,X1,M1,Y1,Z1);
endmodule
```

### Base Verilog Code:
module top(input wire CLK, input wire [4:0] X0, input wire [4:0] X1, reg [4:0] M0, reg [4:0] M1, reg [4:0] Y0, reg [4:0] Y1, reg [4:0] Z0, reg [4:0] Z1);
	comp C0