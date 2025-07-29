```verilog
module dff(do,di,clk,sel); // Behavioral D Flip-Flop
output do[1:0];
input di[1:0],clk;
reg do[1:0]; // Output must be reg for procedural assignment
initial
do[1:0]={1'b0,1'b0}; // Initialize output
// Assign input 'di' to output 'do' on negative clock edge
always@(negedge clk) begin
case(sel)
1'b0:do[0]<=di[0];
1'b1:do[1]<=di[1];
default:do[1:0]={1'b0,1'b0};
endcase
end
endmodule
```
### Test Bench:
```verilog
module tb_dff();
reg di[1:0],clk,sel;
wire do[1:0];
dff UUT(do,di,clk,sel);
initial begin
di[1:0] = 2'b00;
clk = 1'b0;
sel = 1'b0;
end
always begin
#10 clk = ~clk;
end
always begin
#10 sel = ~sel;
end
initial begin
#500 $finish;
end
endmodule
```
### Screenshot Output:
![ScreenShot