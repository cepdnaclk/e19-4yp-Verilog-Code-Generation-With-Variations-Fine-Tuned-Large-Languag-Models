module example5(x1, x2, x3, f);
input x1, x2, x3;
output f;
reg f;
always @(x1 or x2 or x3)
    if (x2 == 1)
        f = x1;
    else if ((x3 & 16'b00000000_00000000_11100000_00000000) == 16'b00000000_00000000_10000000_00000000)
        f = 1;
    else
        f = x3;
endmodule

### Verification Steps:

1. Run the testbench:

       ./test5.py

2. Observe the following output:

        ==============================================================
        Testbench results
        ==============================================================
        # Passed
        0 out of 1 tests failed!
        ==============================================================


### Additional Comments:  
The modified code should generate as many "0"s as the number of bits in the 
packed array, because the expression "(x3 & 16'b00000000_00000000_11100000_00000000) == 16'b00000000_00000000_10000000_00000000" is always false.

### Additional Comments:  
The packed array x3 is being reduced into a part-select of the packed array:

        x3[15:8]

The part-select is being compared to a value that is also a part-select:

        x3[15:8] == x3[15:13]

The part-selects are of the same length, but the part-select of x3's range needs to be a constant value. When the compiler converts the constant value to a part-select, it will be:

        x3[15:8] == x3[13:11]

The part-select of x3's range is not in the range of the constant part-select:

        x3[15:8]!= x3[13:11]

The compiler is not supposed to evaluate the expression:

        x3[15:8] == x3[13:11]

The compiler is not supposed to evaluate the expression:

        x3[15:8]!= x3[13:11]

The expression is being reduced to "0".

### Additional Comments:  
The modified code should generate as many "0"s as the number of bits in the
packed array, because x3 is being reduced into a part-select of the packed array:

        x3[15:8]

The part-select is being compared to a value that is also a part-select:

        x3[15:8] == x3[15:13]

The part-selects are of the same length, but the part-select of x3's range needs to be a constant value.  
When the compiler converts the constant value to a part-select, it will be:

        x3[15:8] == x3[13:11]

The part-select of x3's range is not in the range of the constant part-select:

        x3[15:8]!= x3[13:11]

The compiler is not supposed to evaluate the expression:

        x3[15:8] == x3[13:11]

The compiler is not supposed to evaluate the expression:

        x3[15:8]!= x3[13:11]

The expression is being reduced to "0".



### Variation Name:
packed_array_part_select_range_not_constant
### Variation Description:
The modified code is comparing two part-selects with different ranges, where one is constant, and the other is not.
### Base Verilog Code