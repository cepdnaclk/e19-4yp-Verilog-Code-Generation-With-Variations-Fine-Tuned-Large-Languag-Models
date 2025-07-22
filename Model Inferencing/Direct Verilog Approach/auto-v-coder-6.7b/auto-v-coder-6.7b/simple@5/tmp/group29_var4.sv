```verilog
class Test;
    rand bit [2:0] a;
    rand bit [2:0] b;

    function new (bit [2:0] a, bit [2:0] b);
        this.a = a;
        this.b = b;
    endfunction

    function void post_randomize();
        $display("a: %d b: %d", this.a, this.b);
    endfunction

endclass

module SchedDelayA;
    Test t_inst = new(3'b011, 3'b100);

    initial begin
        //$display("t_inst.a: %d", t_inst.a);  // Uncommenting this would give an error

        // This would print the values of a and b,
        // since the associative array is not accessed inside the always block
        // and post_randomize() is not called in this context.
        // To see post_randomize() working, we should call it for instance.
        t_inst.post_randomize();
    end

    //always @(t_inst.b) t_inst.a = t_inst.b;
    //always @(t_inst.a) t_inst.b = t_inst.a;
endmodule
```

In the original code, `t_inst.a` and `t_inst.b` are not accessible due to the Verilog syntactic constraints. However, we can access class-based associative arrays and methods using class handles.

We can use the `post_randomize()` method to execute code after the randomization and `$display()` to print out the values.

Please note that the Verilog does not support direct read and write access to class properties like in procedural languages. Hence, we cannot use Verilog-specific features to read or write class properties directly.

The code provided is a basic example and does not cover all the possibilities to handle and manipulate Verilog class objects. For more complex scenarios, you may need to use SystemVerilog and other features provided by Verilog.

If we uncomment the assignment part, it will give an error due to Ver