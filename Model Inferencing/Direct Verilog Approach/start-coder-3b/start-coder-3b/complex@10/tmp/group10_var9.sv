```
module d_ff (input d, clk, s, r, output reg q, q_b );
input a[3:0], b;
always @(posedge clk) begin : clocked
if (a == 0)
q <= 0;
else if (a inside {0, 1})
q <= 1;
else
q <= a;
end
endmodule
```
### Output:

![Inside](image/inside.png)

# 3. End Of Module

## 3.1 How to use `end` keyword?

`end` keyword is used as an end of module in Verilog code. It is a mandatory keyword and it must be used at the end of module, when you write the code.

Here is an example of valid `end` keyword usage:
```
endmodule
```

## 3.2 What is the purpose of `end` keyword?

The purpose of the `end` keyword in a module is to specify the end of module.

## 3.3 Why is `end` keyword mandatory?

The `end` keyword is mandatory in module code. The `end` keyword is used to specify the end of a module. Without the `end` keyword, the code will be marked as an error.

# 4. Using If Statements

## 4.1 What is an if statement?

An if statement is a condition that can be used to make decisions in the code. If the condition evaluates to true, the code inside the block is executed, and if it evaluates to false, code inside the else block is executed.

## 4.2 How to use an if statement?

An if statement is used to make decisions in the code by evaluating a condition. The condition can be a simple boolean expression or a complex expression. The if statement must be written inside a module, in a block, and the block must be an `always` block. The if statement must end with a `end` keyword.

Here is an example of an if statement:
```
if (condition) {
    // code executed when condition evaluates to true
} else {
    // code executed when condition evaluates to false
}
```

## 4.3 Example:
### Verilog Code:
```
module d_ff (input d, clk, s, r, output reg q, q_b );
always @(posedge clk) begin : clocked
if (d == 0)
q <= 0;
else if (d == 1)
q <= 1;
else
q <= 0;
end
endmodule
```
### Output:

![Inside](image/if.png)

# 5. Using Case Statements

## 5.1 What is a case statement?

A case statement is a control flow statement that is used to handle multiple conditions in the code. A case statement is used to group conditions into different cases, and to execute code for each case.

## 5.2 How to use a case statement?

A case statement can be used to handle multiple conditions in the code. The syntax of a case statement is as follows:
```
case (value) {
    case_value1:
        // Code to execute when the value matches case_value1
        break;
    case_value2:
        // Code to execute when the value matches case_value2
        break;
   ...
    default:
        // Code to execute when none of the other cases match
}
```
In a case statement, the `case` keyword is used to open the case block, followed by the `value` to match against. The `:` character is used to separate the case from the block.

Inside the case, one or more case values can be used to match against the `value`. The `break` statement is used to exit the case block if the value matches. If the value doesn't match, the next case value is checked. If none of the match, the default case is executed.

Here is an example of a case statement:
```
case (value) {
    case_value1:
        // Code to execute when the value matches case_value1
        break;
    case_value2:
        // Code to execute when the value matches case_value2
        break;
   ...
    default:
        // Code to execute when none of the other cases match
}
```
## 5.3 Example:
### Verilog Code:
```
module d_ff (input d, clk, s, r, output reg q, q_b );
always @(posedge clk) begin : clocked

case (d)
0 : q <= 0;
1 : q <= 1;
default : q <= 0;
endcase
end
endmodule
```
### Output:

![Inside](image/case.png)

# 6. Using For Loops

## 6.1 What is a for loop?

A for loop is a control flow statement that is used to repeat a block of code multiple times. The for loop can be used to execute a block of code for a fixed number of iterations.

## 6.2 How to use a for loop?

A for loop is used to repeat a block of code multiple times. The syntax of a for loop is as follows:
```
for (initialization; condition; increment) {
    // Block of code to be repeated
}
```
The `for` keyword is used to open the for loop, followed by the initialization that is executed before the loop starts. The `condition` is checked before the loop body is executed. If the condition evaluates to true, the `increment` is executed and the loop body is executed again. If the condition evaluates to false, the loop terminates and the block of code after the for loop is executed.

The `initialization`, `