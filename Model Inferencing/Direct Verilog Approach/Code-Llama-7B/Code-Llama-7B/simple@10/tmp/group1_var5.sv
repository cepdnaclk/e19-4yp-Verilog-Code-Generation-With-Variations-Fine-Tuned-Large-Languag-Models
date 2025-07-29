```VHDL
module XOR_Gate(
    input wire [1:0] A [0:3], B [0:3],
    output wire [1:0] Y [0:3]
);
    assign Y = A ^ B;
endmodule
```
### Testbench
```VHDL
module TEST(
    input [1:0] A [0:3] = '{4'b0001, 4'b0010, 4'b0011, 4'b0100},
    input [1:0] B [0:3] = '{4'b0001, 4'b0010, 4'b0011, 4'b0100},
    output [1:0] Y [0:3]
);

    XOR_Gate uut(
       .A(A),
       .B(B),
       .Y(Y)
    );
endmodule

module test;
    
    TEST test_bench();
    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(1);
        $monitor("%b %b %b", A[0], A[1], A[2]);
        $monitor("%b %b %b", B[0], B[1], B[2]);
        $monitor("%b %b %b", Y[0], Y[1], Y[2]);
        #100 $finish;
    end
    initial begin
        #20 A[0] = 2'b01;
        #20 A[1] = 2'b10;
        #20 A[2] = 2'b