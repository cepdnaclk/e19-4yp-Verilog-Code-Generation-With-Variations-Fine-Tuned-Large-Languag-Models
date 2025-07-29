module Ripple_Add;
    FA fa0();
    FA fa1();
    FA fa2();
    FA fa3();
    FA fa4();
    FA fa5();
    FA fa6();
    FA fa7();
    
    always @(*)
    begin
        fa0.a = 8'b10110010;
        fa1.a = fa0.b[7:3];
        fa2.a = fa1.b[6:2];
        fa3.a = fa2.b[5:1];
        fa4.a = fa3.b[4:0];
        fa5.a = fa2.b[3:1];
        fa6.a = fa5.b[4:0];
        fa7.a = fa6.b[3:0];
    end
endmodule
#### Simulation Results:
![image](https://user-images.githubusercontent.com/87679840/127867019-641919b6-b259-4c2b-a524-55f6108a7a61.png)
It is the same result like part-select expression in the outside operand list.
#### Source Code:
```verilog
module FA;
    
    wire [7:0] a;
    wire [7:0] b;
    wire [7:0] cin;
    wire [7:0] sum;
    
    assign {cin, sum} = a + b + cin;
    
    assign b = a;
    
endmodule

module Ripple_Add;
    FA fa0();
    FA fa1();
    FA fa2();
    FA fa3();
    FA fa4();
    FA fa5();
    FA fa6();
    FA fa7();
    
    always @(*)
    begin
        fa0.a = 8'b10110010;
        fa1.a = fa0.b[7:3];
        fa2.a = fa1.b[6: