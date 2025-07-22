`timescale 1ns/100ps
module ShiftRegister8 (input sl, sr, clk, input [7:0] ParIn, input [1:0] m, output reg [7:0] ParOut);
always @(negedge clk) begin
    ParOut <= ((m[0] | m[1])? ParIn : ParOut) |
              (m[0]? {sl, ParOut[7:1]} : 8'b0) |
              (m[1]? {ParOut[6:0], sr} : 8'b0);
end
endmodule
### Verification:
`timescale 1ns/100ps
module ShiftRegister8 (input sl, sr, clk, input [7:0] ParIn, input [1:0] m, output reg [7:0] ParOut);
always @(negedge clk) begin
    ParOut <= ((m[0] | m[1])? ParIn : ParOut) |
              (m[0]? {sl, ParOut[7:1]} : 8'b0) |
              (m[1]? {ParOut[6:0], sr} : 8'b0);
end
endmodule
// Testbench for ShiftRegister8
`timescale 1ns/100ps
module ShiftRegister8_testbench;
reg clk, sl, sr;
reg [1:0] m;
reg [7:0] ParIn;
wire [7:0] ParOut;
// Instantiate DUT
ShiftRegister8 DUT (.sl(sl),.sr(sr),.clk(clk),.ParIn(ParIn),.m(m),.ParOut(ParOut));
initial begin
    clk = 0;
    sl = 0;
    sr = 0;
    m = 0;
    ParIn = 0;
    #15;
    clk = 1;
    #10;
    clk = 0;
    m = 1;
    #10;
    clk = 1;
    #10;
    clk = 0;
    m = 2