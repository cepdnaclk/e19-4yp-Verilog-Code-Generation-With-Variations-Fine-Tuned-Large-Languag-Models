```verilog
module dff(do,di,clk); 
output reg [3:0] do; 
input [3:0] di; 
input clk; 

always@(posedge clk) begin 
    case (di)
        'b0001: do <= 4'b0001;
        'b0010: do <= 4'b0010;
        'b0100: do <= 4'b0100;
        'b1000: do <= 4'b1000;
        default: do <= 4'b0000;
    endcase 
end 
endmodule
```
In this case, the behavior of the module will change the output do according to the input di. If di is 1, the output do will be 1. If di is 2, the output do will be 2 and so on. If di is not defined case, the output do will be 0. 

Please note that di and do are bit vectors with four bits each, and that the module is declared to be sensitive to both posedge and negedge for the clock signal. 

This code will create the following module:

1) di = 1, do = 1
2) di = 2, do = 2
3) di = 4, do = 4
4) di = 8, do = 8
5) any other di, do = 0

Remember to connect the di and do in your testbench.### 

Note that I used 4'b... notation to specify a bit vector of 4 bits. It means 0001, 0010, 0100, 1000. 

If you want to create more types of cases like when di is `'b0011`, di is `'b0110`, etc. and you want case statement to ignore `di` for other than 1, 2, 4, 8 and any other number, you can add more cases like this:

```verilog
module dff(do,di,clk); 
output reg [3:0] do; 
input [3:0] di;