```
module alu(s, A, B, F);
input [2:0] s;
input [3:0] A, B;
output [3:0] F;
reg [3:0] F;
always @(s or A or B)
    case (s)
        0: F = 4'b0000;
        1: F = B - A;
        2: F = A - B;
        3: F = A + B;
        4: F = A ^ B;
        5: F = A | B;
        6: F = A & B;
        7: F = 4'b1111;
    endcase
endmodule
```
### Testbench Code:
```
module alu_tb;

reg clk, rst;
reg [2:0] s;
reg [3:0] A, B;
wire [3:0] F;

alu u0 (s, A, B, F);

initial
begin
    rst = 1;
    A = 4'd8;
    B = 4'd4;
    s = 3'd0;
    #50;
    rst = 0;
    #100;
    s = 3'd4;
    #400;
    s = 3'd3;
    #1000;
    s = 3'd1;
    #1000;
    s = 3'd2;
    #1000;
    s = 3'd6;
    #1000;
    s = 3'd5;
    #10000;
    $finish;

end

always #2 clk = ~clk;

always @(posedge clk)
begin
  $display("time=%d, s=%b, A=%d, B=%d, F=%d", $time, s, A, B, F);
end

endmodule
```