module example7_7(x1, x2, x3, Clock, f, g);
input x1, x2, x3, Clock;
output f, g;
reg f, g;
reg a[7];
wire [2:0] sel;
always @(sel or x1 or x2 or x3 or Clock)
begin
    a[sel] <= x1 & x2;
    f <= a[sel];
    a[sel] <= x1 & x2;
    if (f)
      g <= x3;
    else
      g <= 'b0;
end
endmodule
### Expected Output:
![image](https://user-images.githubusercontent.com/90485603/154521307-5c5712d2-a2df-4973-a828-11ba58e47873.png)

### Example 7.8:
### Base Verilog Code:
module example7_8(x1, x2, x3