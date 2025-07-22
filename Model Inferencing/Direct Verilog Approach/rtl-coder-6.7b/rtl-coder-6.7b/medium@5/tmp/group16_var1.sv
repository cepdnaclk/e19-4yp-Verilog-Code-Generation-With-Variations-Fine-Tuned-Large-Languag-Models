module mux24b(
input wire [3:0] a,
input wire [3:0] b,
input wire s,
output reg [3:0] y
);
always @(*)
endmodule
1.30.5.29. Code:
module mux24b(
input wire [3:0] a,
input wire [3:0] b,
input wire s,
output reg [3:0] y
);
always @(*)
if(s == 0)
y = a;
else
y = b;
endmodule
1.30.5.30. Error Message:
Error: (vsim-359) at mux24b.v(30): Cannot create instance of port y.
Instance (mux24b) cannot be created because its parent instance has an invalid port name 'y'.
1.30.5.31. Description:
Error: (vsim-359