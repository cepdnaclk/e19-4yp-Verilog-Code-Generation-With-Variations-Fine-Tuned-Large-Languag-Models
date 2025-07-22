module mux4to1(w0, w1, w2, w3, S, f);
input w0, w1, w2, w3;
input [1:0] S;
output f;
reg f;
wire [1:0] VALID = {2{1'b1}};
always @(w0 or w1 or w2 or w3 or S)
    if (S inside {VALID})
        f = (S == 2'b00)? w0 :
            (S == 2'b01)? w1 :
            (S == 2'b10)? w2 :
            /* S == 2'b11 */ w3;
    else
        f = 1'bz;
endmodule
### Original Testbench:
```verilog
`timescale 1ns / 1ps
 
module mux4to1_testbench();
 
reg w0, w1, w2, w3;
reg [1:0] S;
wire f;
 
mux4to1 dut (.w0,.w1,.w2,.w3,.S,.f);
 
initial begin
  // Test all combinations of inputs with every valid state
  for (int i = 3'b000; i < 3'b110; i = i + 1) begin
    #20 S = i[1:0];
    w0 = i[2];
    w1 = ~i[2];
    w2 = i[2];
    w3 = ~i[2];
  end
end
endmodule
```