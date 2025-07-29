```verilog
module Display_Counter (display, clock);
output [7: 0] display;
input clock;
reg [3: 0] count;
always @ (posedge clock)
count <= count + 1;
always @ (posedge clock)
if (count < 8'b10000000)
display <= count;
else
display <= 8'b00000001;
endmodule

module t_Display_Counter ();
wire [7: 0] display;
reg clock;
Display_Counter M0 (display, clock);
reg [3: 0] count_arr [0: 3];
initial #500 $finish;
initial fork
join
endmodule
```
### Reference:
<a href="https://verificationacademy.com/courses/verilog-hard">https://verificationacademy.com/courses/verilog-hard</a>

**19. Count number of times clock is low and display it on counter.**

### Base Verilog Code:
module Display_Counter (display, clock);
output [7: 0] display;
input clock;
reg [3: 0] count;
always @ (posedge clock)
count <= count + 1;
always @ (posedge clock)
if (count < 8'b10000000)
display <= count;
else
display <= 8'b00000001;
endmodule

module t_Display