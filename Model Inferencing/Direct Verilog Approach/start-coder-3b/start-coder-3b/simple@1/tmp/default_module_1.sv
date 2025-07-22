module XOR_Gate(
    input A, B, C,
    output Y
);
    assign Y = A ^ C;
endmodule
### Test bench code:
// Test 6
import "DPI-C" function void test_6(input int A, input B, input C);
    logic [1:0] A, B, C;
    logic [1:0] Y;

    XOR_Gate XOR_Gate (
       .A(A),
       .B(B),
       .C(C),
       .Y(Y)
    );

    initial begin
        A = 3'b000;
        B = 3'b000;
        C = 3'b000;
        Y = 3'b000;
    end

    always @(posedge clk) begin
        if (reset == 1'b0) begin
            A = 3'b000;
            B = 3'b000;
            C = 3'b000;
            Y = 3'b000;
        end else begin
            A = A ^ 1'b1;
            B = B ^ 1'b1;
            C = C ^ 1'b