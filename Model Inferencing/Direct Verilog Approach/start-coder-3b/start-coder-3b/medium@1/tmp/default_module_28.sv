module test2(o1,o2,a,b);
integer i;
output wire [1:0]o1;
output wire [1:0]o2;
input wire [1:0]a;
input wire [1:0]b;
and g0(o1,a[1],a[0]);
and g1(o2,b[1],b[0]);
initial begin
o1 = a[1]*b[0];
o2 = a[0]*b[1];
end
endmodule

### Example with Inputs and Outputs

In the following example, a combinational logic is constructed to implement the sum of the AOI.

### Base Verilog Code:
module test3(o,a,b);
integer i;
output wire [1:0]o;
input wire [1:0]a;
input wire [1:0]b;
and g0(o[0],a[1],a[0]);
and g1(o[1