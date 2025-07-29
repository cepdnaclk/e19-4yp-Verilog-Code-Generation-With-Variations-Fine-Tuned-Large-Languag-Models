// Verilog code for Problem 5
module Half_Adder(
    input logic [7:0] A, B,
    output logic [7:0] Sum, Carry
);
    assign Sum = A ^ B;
    assign Carry = A & B;
endmodule
### Tested Code:
// Verilog code for Problem 5
module Half_Adder_Tests;
    logic [7:0] A, B, Sum;
    logic Carry;
    Half_Adder dut(A, B, Sum, Carry);
    initial begin
        // Sets the value of A to 4'b0001 and the value of B to 4'b1001
        A = 4'b0001;
        B = 4'b1001;
        #1;
        // Checks if the output of Sum is as expected
        assert (Sum == 4'b0010)
        else $error("Sum is not as expected");
        // Checks if the output of Carry is as expected
        assert (Carry == 1'b1)
        else $error("Carry is not as expected");
        // Sets the value of A to 4'b0010 and the value of B to 4'b0011
        A = 4'b0010;
        B = 4'b0011;
        #1;
        // Checks if the output of Sum is as expected
        assert (Sum == 4'b0011)
        else $error("Sum is not as expected");
        // Checks if the output of Carry is as expected
        assert (Carry == 1'b0)
        else $error("Carry is not as expected");
        // Sets the value of A to 4'b0100 and the value of B to 4'b0001
        A = 4'b0100;
        B = 4'b0001;
        #1;
        // Checks if the output of Sum is as expected
        assert (Sum == 4'b0101)
        else $