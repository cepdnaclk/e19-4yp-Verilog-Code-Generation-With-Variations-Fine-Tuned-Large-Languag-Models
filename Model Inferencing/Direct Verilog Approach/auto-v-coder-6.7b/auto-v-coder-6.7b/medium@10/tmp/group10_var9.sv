```
module reg4(D, Clock, Resetn, Q, index);
input [3:0] D;
input Clock, Resetn;
output [3:0] Q;
input [1:0] index;
reg [3:0] Q;
always @(posedge Clock or negedge Resetn)
    if (Resetn == 0)
        Q <= 4'b0000;
    else
        Q <= D[index];
endmodule
```
This module now takes an additional input `index`. The value of `D[index]` is assigned to `Q` on every positive-edge and asynchronous reset condition. This will create an array of 4 registers, where each register can be selected and initialized to a different value specified by `D` on the positive-edge.### Test Bench:
```verilog
module reg4_test;
reg [3:0] D;
reg Clock, Resetn;
wire [3:0] Q;
wire [1:0] index;

reg4 dut (D, Clock, Resetn, Q, index);

initial begin
    Clock = 0;
    Resetn = 0;
    index = 2'b00;
    #10 Resetn = 1;
    #10 index = 2'b11;
    #10 D = 4'b1010;
    #10 index = 2'b01;
    #10 D = 4'b0101;
    @(posedge Clock);
    if (Q!== D[index]) begin
        $display("Error: Expected Q to be %b at index %b, but got %b", D, index, Q);
        $stop;
    end else begin
        $display("Test passed: Q is %b at index %b", Q, index);
    end
    $finish;
end

always begin
    #5 Clock = ~Clock;
end
endmodule
```
This test bench simulates the process of asynchronous reset, initializing the D register with a value, changing the index, and then checking the value of Q at that index. If the value matches the expected value, the