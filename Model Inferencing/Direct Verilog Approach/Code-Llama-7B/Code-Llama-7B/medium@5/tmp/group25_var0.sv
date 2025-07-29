```verilog
module example7_5(x1, x2, x3, Clock, f, g);
input x1, x2, x3, Clock;
output reg f, g;
reg f_latch[2:0], g_latch[2:0];
always @(posedge Clock)
begin
    case(3'd0)
        Clock : f_latch[0] = f;
        g_latch[0] = x1 & x2;
        g_latch[1] = x1 | x2;
        default: g_latch[2] = x1 | x2 | x3;
    endcase
    if (f_latch[2])
        g = g_latch[0] | g_latch[1];
    else
        g = g_latch[2];
    f = g_latch[2];
end
endmodule
```
### Testbench Code:
```verilog
module testbench_example7_5();
wire x1, x2, x3, Clock;
wire f, g;
example7_5 example7_5_DUT
(.x1(x1),.x2(x2),.x3(x3),.Clock(Clock),.f(f),.g(g));
initial
begin
    x1 = 0;
    x2 = 0;
    x3 = 0;
    Clock = 0;
    #0.5 Clock = 1;
    #0.5 Clock = 0;
end
always
#10 Clock = ~Clock;
initial
begin
    $monitor("%d %d %d %d %d", x1, x2, x3, Clock, g);
    #1000;
    $finish;
end
endmodule
```
Note the usage of a case expression.
### Test Results:
![2021-10-20_13h36_46](https://user-images.githubusercontent.com/94447