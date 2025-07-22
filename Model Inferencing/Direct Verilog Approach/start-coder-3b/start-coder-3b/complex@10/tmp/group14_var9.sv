module hex7seg_le (
input wire [3:0] x,
output wire [6:0] a_to_g // Outputs for segments a,b,c,d,e,f,g
);
// Logic equations for each segment (active high assumed)
generate
for ( i = 6; i >= 0; i = i-1 ) begin
assign a_to_g[i] = ~x[3] & ~x[2] & ~x[1] & x[0] // a (segment index 6)
| ~x[3] & x[2] & ~x[1] & ~x[0]
| x[3] & x[2] & ~x[1] & x[0]
| x[3] & ~x[2] & x[1] & x[0];
assign a_to_g[i] = x[2] & x[1] & ~x[0] // b (segment index 5)
| x[3] & x[1] & x[0]
| ~x[3] & x[2] & ~x[1] & x[0]
| x[3] & x[2] & ~x[1] & ~x[0];
assign a_to_g[i] = ~x[3] & ~x[2] & x[1] & ~x[0] // c (segment index 4)
| x[3] & x[2] & x[1]
| x[3] & x[2] & ~x[0];
assign a_to_g[i] = ~x[3] & ~x[2] & ~x[1] & x[0] // d (segment index 3)
| ~x[3] & x[2] & ~x[1] & ~x[0]
| x[3] & ~x[2] & x[1] & ~x[0]
| x[2] & x[1] & x[0];
assign a_to_g[i] = ~x[3] & x[0] // e (segment index 2)
| ~x[3] & x[2] & ~x[1]
| ~x[2] & ~x[1] & x[0];
assign a_to_g[i] = ~x[3] & ~x[2] & x[0] // f (segment index 1)
| ~x[3] & ~x[2] & x[1]
| ~x[3] & x[1] & x[0]
| x[3] & x[2] & ~x[1] & x[0];
assign a_to_g[i] = ~x[3] & ~x[2] & ~x[1] // g (segment index 0)
| x[3] & x[2] & ~x[1] & ~x[0]
| ~x[3] & x[2] & x[1] & x[0];
end
endgenerate
endmodule


The result is the same as before, but the code is much clearer.

## 3 Disadvantages of Indexed Part Select

The indexed part select is an elegant and very useful method for generating logic equations for all outputs of a module. However, it is not the only method that can be used to generate logic equations. There are a few disadvantages that should be considered.

### 3.1 More Complex Code

Compared to the original code, the modified code is more complex and longer. The difference in length is not insignificant. However, the original code has not been modified much. Because some of the variables have not been changed, they are still declared with the same data types as before. The only thing that has been changed is the initialization of the arrays. The new code initializes the array before the generate block.

### 3.2 Less Easily Maintenable

The generate block itself is more difficult to maintain than the original code. Since it can be more difficult to read and understand the original code, developers who need to maintain the code for long periods of time may consider writing the code without the generate block. On the other hand, the generated code is easy to maintain. If some logic equations are changed, the generate block can be used to update the code easily.

### 3.3 Performance Degradation

Since generating logic equations with the generate block requires extra time, it has been observed that there is a certain performance drop in the generated code.

## 4 Summary

Although the indexed part select is a convenient method for generating logic equations for outputs of a module, it is not the only method. Some developers may find that some methods are easier and more elegant than others. However, some methods, such as the generate block, have a number of disadvantages that can affect their usability.