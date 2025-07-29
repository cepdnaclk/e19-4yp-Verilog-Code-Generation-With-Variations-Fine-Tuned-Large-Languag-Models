```Verilog
module mux4to1(w0, w1, w2, w3, S, f);
input w0, w1, w2, w3;
input [1:0] S;
output f;
reg f;
// Insert a constant-packed array declared at module scope
enum{JK,HY}Sv[2:0]={2'b10,2'b01,2'b00};
inside
always @(w0 or w1 or w2 or w3 or S)
    if (S inside {Sv})
        f = Sv[S];
endmodule
```
### Simulation Result:
![image](https://github.com/GoldPiggy/Verilog-Code-Examples/blob/master/Chapter%2009/9.3-2/image/mux4to1-1.png?raw=true)
![image](https://github.com/GoldPiggy/Verilog-Code-Examples/blob/master/Chapter%2009/9.3-2/image/mux4to1-2.png?raw=true)
![image](https://github.com/GoldPiggy/Verilog-Code-Examples/blob/master/Chapter%2009/9.3-2/image/mux4to1-3.png?raw=true)
![image](https://github.com/GoldPiggy/Verilog-Code-Examples/blob/master/Chapter%2009/9.3-2/image/mux4to1-4.png?raw=true)
![image](https://github.com/GoldPiggy/Verilog-Code-Examples/blob/master/Chapter%2009/9.3-2/image/mux4to1-5.png?raw=true)
![image](https://github.com/GoldPiggy/Verilog-Code-Examples/blob/master/Chapter%2009/9.3-2/image/mux4to1-6.png?raw=true)

### Design Constraints
- The `inside` operator allows the use of a constant-packed array declared at module scope:
###### Module
```Verilog
module mux4to1(w0, w1, w2, w3, S, f);
input w0, w1, w2, w3;
input [1:0] S;
output f;
reg f;
// Insert a constant-packed array declared at module scope
enum{JK,HY}Sv[2:0]={2'b10,2'b01,2'b00};
always @(w0 or w1 or w2 or w3 or S)
    if (S inside {Sv})
        f = Sv[S];
endmodule
```
###### Testbench
```Verilog
module mux4to1_tb();
reg [1:0] S;
reg w0, w1, w2, w3;
wire f;
mux4to1 u1(w0, w1, w2, w3, S, f);
initial begin
    $dumpfile("mux4to1.vcd");
    $dumpvars(0,mux4to1);
    $dumpvars(0,mux4to1_tb);
    S  = 2'b00;
    w0 = 1'b0;
    w1 = 1'b0;
    w2 = 1'b0;
    w3 = 1'b0;
    #10
    S  = 2'b01;
    w0 = 1'b1;
    w1 = 1'b0;
    w2 = 1'b0;
    w3 = 1'b0;
    #10
    S  = 2'b10;
    w0 = 1'b0;
    w1 = 1'b1;
    w2 = 1'b0;
    w3 = 1'b0;
    #10
    S  = 2'b10;
    w0 = 1'b0;
    w1 = 1'b0;