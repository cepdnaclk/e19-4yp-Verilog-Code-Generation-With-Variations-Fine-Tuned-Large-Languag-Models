`if (x inside {8'b10000000, 8'b11000000, 8'b11100000})`
### Inferred Logic:
![inferred logic](https://junyangwang.github.io/public/post_img/2019-06-30-verilog-lab-2-post/inferred_logic.png)
### Question 5
1. How does an `always` block with an `if` statement evaluate signals?
2. How does an `always` block with a `case` statement evaluate signals?
3. What is the difference between an `if` and `case` condition in an `always` block?
4. What are the differences between the following `case` statements?
```verilog
case(x)
0, 1: Ld = 0;
2, 8: Ld = 1;
3, 9: Ld = 1;
endcase
```
```verilog
case(x)
0, 1: Ld = 0;
2, 8: Ld = 0;
3, 9: Ld = 1;
endcase
```
```verilog
case(x)
0, 1: Ld = 0;
2, 8: Ld = 1;
3, 9: Ld = 0;
endcase
```
### Answer
1. The `if` statement evaluates the statement and the conditional expression at the time of synthesis. The `else` statement is assumed to be `0`. If the statement is not synthesizable, the synthesis will be in error.
2. The `case` statement evaluates the statement at the time of synthesis. If it can't be synthesized, the synthesis will be in error.
3. The `if` statement always evaluates the statement, which is `0` in the example.
4. They're functionally equivalent.
### Question 6
Which of the following statements are true?
1. Dual-port RAMs exist in Verilog.
2. Instantiation has the effect of creating an **instance** of a module.
3. A module instance is a block of logic.
4. Always blocks always execute in the order they appear in the code.
5. If-else statements may be used in combinational logic.
6. An if-else statement may be used in an `always` block.
7. A case statement may be used in an `always` block.
8. Code is executed in the order that it appears in the code.
9. A module instance is a block of logic connected to the outside world.
10. It's possible to synthesize a device with a dual ported RAM in it.
11. There are no combinational loops in combinational logic.
### Answer
1. True
2. False
3. True
4. False
5. True
6. True
7. True
8. True
9. False
10. True
11. False
### Question 7
Consider the following module:
```verilog
module alu (result, x, y, alu_op);
output [3: 0] result;
input [3: 0] x, y;
input [2: 0] alu_op;
reg [3: 0] result;
always @ (x, y, alu_op) begin
case (alu_op)
2'b00: result = x + y;
2'b01: result = x - y;
2'b10: result = x & y;
2'b11: result = x | y;
endcase
end
endmodule
```
Which of these is the correct way to create an instance of the `alu` module?
```verilog
alu my_alu(.result(result),.x(x),.y(y),.alu_op(alu_op));
```
```verilog
alu my_alu(result, x, y, alu_op);
```
```verilog
alu my_alu(result, x, y, alu_op, result, x, y, alu_op);
```
```verilog
reg [3: 0] result;
reg [3: 0] x;
reg [3: 0] y;
reg [2: