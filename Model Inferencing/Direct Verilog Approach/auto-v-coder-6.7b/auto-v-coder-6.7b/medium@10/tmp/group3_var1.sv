```Verilog
module FA;
    reg [16:0] in;
    reg [4:0] out;
    
    always @ (*) begin
       out = in[15:11];  //Part Select
    end
endmodule

module Ripple_Add;
    FA fa0();
    FA fa1();
    FA fa2();
    FA fa3();
endmodule
```
In the above code, the module 'FA' has an input `in` of 17 bits and an output `out` of 5 bits. The always block inside the `FA` module contains a part-select expression that selects the 15th through 11st bits of the input `in` and assigns them to the output `out`. This part-select expression is used to generate the ripple addition of the four-bit input to a five-bit output. 

The Ripple_Add module is a dummy module. It contains four instances of the FA module, each with an input and an output. In a real project, these four instances would be used to build a ripple adder. 

This code doesn't do any meaningful computation. It's purely illustrative and meant to demonstrate the part-select expression. If you are testing a ripple adder in a real project, you would use these four instances to add four 4-bit numbers together to create a 5-bit result.

Please note that part-select syntax applies for array variables only. Thus, for a single-bit, you would have to use indexing.

```Verilog
module FA;
    reg in;
    reg out;
    
    always @ (*) begin
       out = in;  //Bit Select
    end
endmodule

module Ripple_Add;
    FA fa0();
    FA fa1();
    FA fa2();
    FA fa3();
endmodule
```
In this modified code, each instance of the FA module has a single-bit input and corresponding output. The always block inside the `FA` module assigns the value of the input to the output, effectively doing nothing. 

This code doesn't do any meaningful computation. It's purely illustrative and meant to demonstrate the bit-select expression. If you are testing