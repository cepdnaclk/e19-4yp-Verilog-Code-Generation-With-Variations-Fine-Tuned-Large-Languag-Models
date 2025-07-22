```verilog

module SchedDelayA;

// Class declaration
class RegClass;
    reg regA, regB;
    function new (reg a, reg b);
        this.regA = a;
        this.regB = b;
    endfunction
    function reg writeRegB(reg b);
        this.regB = b;
    endfunction
    function reg readRegA();
        return this.regA;
    endfunction
endclass

initial
begin
    // Instantiate the class
    RegClass regInst = new(.a(1'b0),.b(1'b0));

    // Test class-based associative access
    regInst.writeRegB(1'b1);  // Equivalent to always @(b) a = b;

    // Regular read and write accesses
    $display("regA: %0d regB: %0d", regInst.readRegA(), regInst.regB);

    $finish;
end

endmodule
```

In this code, we first declare a class `RegClass`. This class has two registers `regA` and `regB`. The class constructor `new` is used to initialize these registers. We then instantiate this class and access its methods to perform the same operations as in the base example. Finally, we print out the values of `regA` and `regB` and finish simulation. This code can be used to test the class-based access to registers. It is a simple demonstration and real-world scenarios are much more complex with more intricate class relationships and interactions.

Note that this code is for Verilog-2005 and later versions, where `new` has been defined as a method in classes. If you are using a Verilog-2001 or earlier version, you would need to use the `initial` statement to instantiate the class and perform operations. This code is also a simple demonstration and may not cover all possible use cases or best practices when dealing with Verilog-based design. 

Lastly, the code does not run the simulation in the simulation environment because you're using a real hardware in the context of hardware verification. To run this code, you'll need to compile it