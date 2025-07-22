```verilog
module FA;
    always
    begin
        $display("Inside FA");
    end
endmodule

module Ripple_Add;
    FA fa0();
    FA fa1();
    FA fa2();
    FA fa3();

    always
    begin
        #1;
        $display("FA0[1:0]: %b", fa0[1:0]); // This will result in an error because part-select expressions cannot be applied directly to instances in Verilog. It must be used with a module instantiation.
    end
endmodule
```
However, as part-select expressions cannot be directly applied to instances, as described above, this will result in an error. We can use part-select expressions with a module instance, but the part-select expression must be applied to a module instantiation and not a module instance.

Here's a modified code that includes a part-select within the `assign` statement within the `Ripple_Add` module. This code will not result in an error but it won't run the intended operation.

```verilog
module FA;
    always
    begin
        $display("FA Inside");
    end
endmodule

module Ripple_Add;
    FA fa0();
    FA fa1();
    FA fa2();
    FA fa3();

    always
    begin
        #1;
        assign fa0[1:0] = 2'b11; // This is a part-select expression, using assign statement
        $display("FA0[1:0]: %b", fa0[1:0]); // This will not work as intended, because assign is not a valid statement inside a module instantiation.
    end
endmodule
```
In this modified code, we still can't use a part-select expression to assign a value to an instance of `FA` in a construct like `assign`. 

However, note that in Verilog you can indeed use part-select expressions within module instances, but these must be on module instantiations, not instances. 

Here is a final code snippet that shows how to correctly use part-select expressions:

```verilog
module FA;
    always
    begin
        $display("FA Inside");