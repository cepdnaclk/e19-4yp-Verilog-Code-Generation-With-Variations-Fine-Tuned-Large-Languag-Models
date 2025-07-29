module mux24b_variation(
input wire [3:0] a,
input wire [3:0] b,
input wire s,
output reg [3:0] y
);
always @ (*)
if(s == 0)
y = a;
else
if(X[Y] == 1) // XMR style hierarchy
y = b;
else
y = a;
endmodule
### 2D array index expression
X[Y]
### Variation Type:
Bug Fix
###