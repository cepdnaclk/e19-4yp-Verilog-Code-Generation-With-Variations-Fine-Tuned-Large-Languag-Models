module example13(x1, x2, x3, x4, g);
input x1, x2, x3, x4;
output g;

initial
g = 0;

always @(posedge clk) begin
g = i0? (x1 & x3) : (x2 & x4);
g = i1? g : g;
g = i2? g : g;
g = i3? g: g;
end
'''

_example14 = '''
### Base Verilog Code:
module example14(x1, x2, x3, x4, g);
input x1, x2, x3, x4;
output g;

always @(posedge clk)
g = (x