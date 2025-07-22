module Chap1Counter (Clk, Reset, Count);
input Clk, Reset;
output [3:0] Count;
reg [3:0] Count;
always @(posedge Clk) begin
    if(Reset) begin
        Count = 0;
        #2
    end
    else begin
        Count = Count + 1;
        #2
    end
end
endmodule
### Testbench Code:
module Chap1CounterTest(input Clk, Reset, output [3:0] Count);
reg Clk, Reset;
wire [3:0] Count;
Chap1Counter uut_1(Clk, Reset, Count);
initial begin Clk = 0; Reset = 1; #10; Reset = 0; end
always #1 Clk = ~Clk;
endmodule
module Chap1Counter_testbench();
reg [3:0] Count;
Chap1CounterTest a (Clk, Reset, Count);
endmodule
### Testbench Input and Output:
Clk Reset Count
0 1 0
1 0 1
0 1 2
1 0 3
0 1 4
1 0 5
0 1 6
1 0 7
0 1 8
1 0 9
0 1 10
1 0 11
```
### The code is equivalent to:
```verilog
module Chap1Counter (Clk, Reset, Count);
input Clk, Reset;
output [3:0] Count;
reg [3:0] Count;
always @(posedge Clk) begin
    if(Reset) begin
        Count = 0;
        #2
    end
    else begin
        Count = Count + 1;
        #2
    end
end
endmodule
```
### Testbench Code:
```verilog
module Chap1CounterTest(input Clk, Reset, output [3:0] Count);
reg Clk, Reset;
wire [3:0] Count;
Chap1Counter uut_1(Clk, Reset, Count);
initial begin Clk = 0; Reset = 1; #1