``` verilog
module Half_Adder(
    input A, B,
    output logic [7:0] Sum, Carry
);
    assign Sum = A ^ B;
    assign Carry = A & B;
endmodule
```
### Description
Verilog signals are always declared as wires; however, this is unconventional. Modern Verilog standards require that all signals be declared as either `reg` or `logic`. This allows for more flexibility when writing code. In my opinion, `logic [7:0]` is superior to `reg` because it is self explanatory by nature. `reg [7:0]` is more difficult to read and understand, as it requires a secondary read to understand what it means.

### Source Code
``` verilog
module Half_Adder(
    input A, B,
    output logic [7:0] Sum, Carry
);
    assign Sum = A ^ B;
    assign Carry = A & B;
endmodule
```
### Simulation
``` verilog
module Half_Adder_tb;
    reg A, B;
    wire [7:0] Sum;
    wire Carry;
    Half_Adder UUT(.A(A),.B(B),.Sum(Sum),.Carry(Carry));

    initial begin
        // Initialize Inputs
        A = 0;
        B = 0;
        #10ps;
        // Expected Outputs
        assert((Sum === 0) && (Carry === 0)) else $error("Test 1 Failed");
        // Change inputs
        A = 0;
        B = 1;
        #10ps;
        // Expected Outputs
        assert((Sum === 1) && (Carry === 0)) else $error("Test 2 Failed");
        // Change inputs
        A = 1;
        B = 0;
        #10ps;
        // Expected Outputs
        assert((Sum === 1) && (Carry === 0)) else $error("Test 3 Failed");
        // Change inputs
        A = 1;
        B = 1;
        #10ps;
        // Expected Outputs