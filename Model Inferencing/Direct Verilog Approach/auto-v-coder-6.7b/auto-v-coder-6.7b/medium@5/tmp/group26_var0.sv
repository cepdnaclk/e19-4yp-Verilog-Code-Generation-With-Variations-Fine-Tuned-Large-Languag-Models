```Verilog
module example5(x1, x2, x3, f);
input [7:0] x1 [1:0];
input [7:0] x2;
input [7:0] x3;
output [7:0] f;
reg [7:0] f;
always @(x1 or x2 or x3)
    if (x2 <= 2'b11 && x2 >= 2'b00)
        f = x1[x2];
    else
        f = x3;
endmodule
```
In the above code, `x1` is a 2-D packed array with 2 rows and 4 columns each of 8 bits. `x2` is an 8-bit input value. Similarly, `x3` is an 8-bit input value. The output `f` is also 8-bit. 

In the `always` block, it uses the part-select of x1 and x2 to assign the value to `f`. If x2 is inside the range of 00 to 11 (both inclusive), then it picks the corresponding value from `x1` and assigns it to `f`. Otherwise, it assigns the value of `x3` to `f`. 

It is important to note that part-select indexes in Verilog start at 0, and the index range is [start_index : end_index]. The last index is actually included in the range. 

Also, you should modify the `if` condition to fit your specific needs if it's not clear what part of x2 we're checking. This example assumes we're checking x2 directly.

Remember to test the sensitivity list of the `always` block. If the input parameters are not changing during one cycle, then the block will not fire causing a combinational loop. You should be careful to ensure the sensitivity list is correct in your design. In this example, it's using all three inputs to ensure they are indeed changing, so the block will be sensitive to changes in all three inputs. If you're unsure, you might want to check this part of the code in a simulator to ensure it's functioning correctly.

Also, always remember to place a block of comments at the beginning of