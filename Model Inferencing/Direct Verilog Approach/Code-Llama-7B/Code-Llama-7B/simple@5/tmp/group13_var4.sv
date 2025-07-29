module Half_Adder(
        input A, B,
        output logic [7:0] Sum, Carry
    );
        assign Sum = A ^ B;
        assign Carry = A & B;
    endmodule
### Test bench:
    `timescale 10ns/1ns
    module Half_Adder_TB;
    reg A, B;
    wire logic [7:0] Sum, Carry;

    HalfAdder DUT (
   .A(A),
   .B(B),
   .Sum(Sum),
   .Carry(Carry)
    );

    initial begin
        A=1'b0;
        B=1'b0;
        #0 A = 1'b1;
        #0 B = 1'b0;
        #0 B = 1'b1;
        #0 A = 1'b0;
        #0 A = 1'b1;
        #0 B = 1'b0;
    end
    endmodule
    ### Simulation:
    iverilog HalfAdder.sv
    vvp a.out
    ### Output:
![2_bit_half_adder_tb.png](https://i.postimg.cc/mZXm5VXF/2_bit_half_adder_tb.png)
### Verification:
![2_bit_half_adder_tb.png](https://i.postimg.cc/mZXm5VXF/2_bit_half_adder_tb.png)
### Comment:
Nothing really to comment on, just the verilog code above in a test bench.
---
## Problem 3: 2-bit Full Adder
### Original Verilog Code:
    module full_adder(
        input wire a, b, c_in,
        output wire s, c_out
    );
        wire s0, s1;
        half_adder ha0(a, b, s0, s1);
        half_adder ha1(s0, c_in, s, c_out);
    endmodule
---