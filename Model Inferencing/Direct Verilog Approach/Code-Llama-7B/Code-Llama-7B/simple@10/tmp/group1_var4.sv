```
module XOR_Gate(
    input logic [1:0] A [0:3],
    output logic Y
);
    assign Y = A[0][0] ^ A[1][1] ^ A[2][2] ^ A[3][3];
endmodule
```
### Original Code:
### Original Test Bench:
// Test Bench for Problem 4
module XOR_Gate_TB;
    logic A, B, Y;
    XOR_Gate U0(A, B, Y);
    initial
        begin
            $dumpfile("XOR_Gate.vcd");
            $dumpvars(0, XOR_Gate);

            repeat(10)
                begin
                    A = $random;
                    B = $random;
                    #10;
                end
            $finish;
        end
endmodule
### Modified Test Bench:
// Test Bench for Problem 4
module XOR_Gate_TB;
    logic [1:0] A [0:3];
    logic Y;
    XOR_Gate U0(A, Y);
    initial
        begin
            $dumpfile("XOR_Gate.vcd");
            $dumpvars(0, XOR_Gate);

            repeat(10)
                begin
                    for (integer i = 0; i < 4; i = i + 1) begin
                        A[i] = $random;
                    end
                    #10;
                end
            $finish;
        end
endmodule
### Original Result:
![Original Results](