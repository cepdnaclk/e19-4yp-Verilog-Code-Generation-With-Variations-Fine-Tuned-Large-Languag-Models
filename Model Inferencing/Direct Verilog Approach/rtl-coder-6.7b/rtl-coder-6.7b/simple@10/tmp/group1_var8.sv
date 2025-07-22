module XOR_Gate(
    input logic [1:0] A [0:3],
    output logic Y
);
    wire A_0_0, A_0_1, A_1_0, A_1_1, A_2_0, A_2_1, A_3_0, A_3_1;
    assign {A_0_0, A_0_1} = A[0];
    assign {A_1_0, A_1_1} = A[1];
    assign {A_2_0, A_2_1} = A[2];
    assign {A_3_0, A_3_1} = A[3];
    assign Y = (A_0_0 ^ A_0_1) |
               (A_1_0 ^ A_1_1) |
               (A_2_0 ^ A_2_1) |
               (A_3_0 ^ A_3_1);
endmodule
### Verification Code:
module tb_XOR_Gate;
    logic [1:0] A [0:3];
    logic Y;
    XOR_Gate uut_XOR_Gate(A, Y);
    initial begin
        // Test 0, expected output: 0
        A[0] = 2'b00;
        A[1] = 2'b00;
        A[2] = 2'b00;
        A[3] = 2'b00;

        #100;
        assert (Y === 0) $display("Test 0 passed.");
        else $error("Test 0 failed. Y = %b", Y);

        // Test 1, expected output: 1
        A[0] = 2'b01;
        A[1] = 2'b00;
        A[2] = 2'b01;
        A[3] = 2'b00;

        #100;
        assert (Y === 1) $display("Test 1 passed.");
        else $error("Test 1 failed. Y = %b", Y);

        // Test