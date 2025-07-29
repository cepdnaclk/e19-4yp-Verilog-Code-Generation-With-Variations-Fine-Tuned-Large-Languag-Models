module example7_5_0(x1, x2, x3, Clock, f, g);
input x1, x2, x3, Clock;
output f, g;
reg f, g;
reg [1:0] t;
wire [1:0] c = {x1, x2}; // Construct [1:0] array
reg [1:0] d = c[t]; // Use t to select element in [1:0] array
always @(posedge Clock)
begin
    f = d[0]; // Use d[0] to select element in [1:0] array
    g = d[1]; // Use d[0] to select element in [1:0] array
end
endmodule
### Testbench Code :
module example7_5_0_test;
wire x1, x2, x3, f, g;
reg Clock;
initial Clock = 0;
always #1 Clock =!Clock;
example7_5_0 example1(x1, x2, x3, Clock, f, g);
initial begin
    x1 = 1'b0;
    x2 = 1'b0;
    x3 = 1'b0;
    #10;
    x1 = 1'b1;
    x2 = 1'b1;
    x3 = 1'b1;
    #10;
    x1 = 1'b1;
    x2 = 1'b0;
    x3 = 1'b0;
    #10;
    x1 = 1'b0;
    x2 = 1'b1;
    x3 = 1'b1;
    #10;
    $stop;
end
endmodule
### Output:
![output](https://raw.githubusercontent.com/dineshannayya/dineshannayya.github.io/master/assets/img/output_0705.PNG)
### Explanation:
1. In the first case statement, since t is at default value, the case statement is expanded to 
```
always @(posedge Clock)
begin
    f = x1 & x2;
    g = f | x3;
end
```

2. In the second case statement, the case statement is expanded to 
```
always @(posedge Clock)
begin
    f = 1;
    g = x3 | x1;
end
```
### Clean up Verilog Code:
```
module example7_5(x1, x2, x3, Clock, f, g);
input x1, x2, x3, Clock;
output f, g;
reg f, g;
reg [1:0] t;
reg [1:0] c = {x1, x2}; // Construct [1:0] array
always @(posedge Clock)
begin
    t = {x3, x1}; // Invert t and select element based on t
    case(t)
        2'b00 : f = x1 & x2;
        2'b10 : f = 1;
        2'b01 : f = x3;
        2'b11 : f = 1;
        default : f = x1 & x2;
    endcase
    case(t)
        2'b00 : g = f | x3;
        2'b10 : g = x3 | x1