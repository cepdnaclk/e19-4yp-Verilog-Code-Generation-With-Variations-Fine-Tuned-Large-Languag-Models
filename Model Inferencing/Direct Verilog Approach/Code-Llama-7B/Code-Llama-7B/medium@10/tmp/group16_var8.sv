module mux24b(
input wire [3:0] a,
input wire [3:0] b,
input wire s,
output reg [3:0] y
);
always @(*)
begin
if (s == 0)
y = a;
else
y = b;
end
if (s == 0)
y[3] = a[3];
else
y[3] = b[3];
if (s == 0)
y[2] = a[2];
else
y[2] = b[2];
if (s == 0)
y[1] = a[1];
else
y[1] = b[1];
if (s == 0)
y[0] = a[0];
else
y[0] = b[0];
endmodule
### Simulation Log:
### Step 1:
### Signal Initialization:
### Step 2:
### Signal Initialization:
### Step 3