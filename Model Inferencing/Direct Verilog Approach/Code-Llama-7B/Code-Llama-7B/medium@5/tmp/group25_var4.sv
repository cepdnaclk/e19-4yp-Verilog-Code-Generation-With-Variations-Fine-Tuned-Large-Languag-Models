module example7_5(x1, x2, x3, Clock, f, g);
input x1, x2, x3, Clock;
output f, g;
reg f, g;
wire [1:0] sel;
reg [1:0] sel_val;
reg [15:0] array [2:0] = {10, 20, 30};

always @(posedge Clock)
begin
    sel = x1 + x2;
    sel_val = array[sel];
    f = x1 & sel_val;
    g = f | x3;
end
endmodule
### Modifications:
- Added output and array:
    - output f, g;
    - reg [15:0] array [2:0] = {10, 20, 30};
- Added wire and sel_val:
    - wire [1:0] sel;
    - reg [1:0] sel_val;
- Added part of always block:
    - sel = x1 + x2;
    - sel_val = array[sel];
    - f = x1 & sel_val;
    - g = f | x3;
### Simulation Inputs:
X1 = 0, X2 = 1, X3 = 0, X4 = 1, X5 = 1
### Simulation Outputs:
F = 1, G = 1
### Simulation Inputs:
X1 = 0, X2 = 1, X3 = 0, X4 = 1, X5 = 0
### Simulation Outputs:
F = 1, G = 0
### Simulation Inputs:
X1 = 0, X2 = 0, X3 = 1, X4 = 1, X5 = 0
### Simulation Outputs:
F = 0, G = 1
### Simulation Inputs:
X1 = 0, X2 = 0, X3 = 1, X4 = 1, X5 = 1
### Simulation Outputs:
F = 0, G = 1
### Simulation Inputs:
X1 = 0, X2 = 0, X3 = 0, X4 = 1, X5 = 1
### Simulation Outputs:
F = 1, G = 1
### Simulation Inputs:
X1 = 0, X2 = 0, X3 = 0, X4 = 1, X5 = 0
### Simulation Outputs:
F = 0, G = 1
### Simulation Inputs:
X1 = 0, X2 = 1, X3 = 1, X4 = 0, X5 = 1
### Simulation Outputs:
F = 1, G = 1
### Simulation Inputs:
X1 = 0, X2 = 1, X3 = 1, X4 = 0, X5 = 0
### Simulation Outputs:
F = 0, G = 1
### Simulation Inputs:
X1 = 0, X2 = 1, X3 = 1, X4 = 1, X5 = 0
### Simulation Outputs:
F = 0, G = 1
### Simulation Inputs:
X1 = 0, X2 = 1, X3 = 1, X4 = 1, X5 = 1
### Simulation Outputs:
F = 0, G = 1
### Simulation Inputs:
X1 = 1, X2 = 0, X3 = 1, X4 = 0, X5 = 1
### Simulation Outputs:
F = 1, G = 1
### Simulation Inputs:
X1 = 1, X2 = 0, X3 = 1, X4 = 0, X5 = 0
### Simulation Outputs:
F = 0, G = 1
### Simulation Inputs:
X1 = 1, X2 = 0, X3 = 1, X4 = 1, X5 = 0
### Simulation Outputs:
F = 0, G = 1
### Simulation Inputs: