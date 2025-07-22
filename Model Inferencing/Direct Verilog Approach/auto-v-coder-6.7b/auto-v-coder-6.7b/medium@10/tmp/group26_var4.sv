```verilog
module example5(array, f);
input [7:0] array;
output [1:0] f;
reg [1:0] f;
always @(array)
    if (array inside {[0:5], [10:15]})
        f = array[1:0];
    else
        f = 2'b0;
endmodule
```
In the above modified code:

- Added an input array of 8 bits (`[7:0] array`)
- Output `f` is a 2-bit register (`reg [1:0] f`)
- Testing whether the part-select of the array is inside the fixed constant range `[0:5]` and `[10:15]`.
- If the part-select is inside the range, then the output `f` is the part-select of the array.
- If the part-select is not inside the range, then the output `f` is zero.
- The `inside` operator is Verilog's keyword that checks if a value lies in a range.

Note: This code assumes that the input array and part-select are 8 bit wide to fit the example range. The `[7:0] array` assumes that the `array` is a 8-bit wide array. The part-select `array[1:0]` assumes that the `array` is at least 2 bit wide. This code also assumes that the array range of `[0:5]` and `[10:15]` is valid for the test condition. Make sure these assumptions match with your actual design. 

Also, the `else` block is optional here because the default value of `f` is 2'b0, so it will be set to 0 regardless of whether the condition is true or false. This should simplify the code and make it more readable. In case you need to introduce more conditions, you might want to omit the `else` block. In this case, you should ensure that `f` takes a value in all cases.

Finally, note that `f = array[1:0];` is not a part of the original code. It was added as a part of the explanation for the modified code. It should