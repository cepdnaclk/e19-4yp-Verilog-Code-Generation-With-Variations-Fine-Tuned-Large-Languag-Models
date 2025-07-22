`timescale 1ns/100ps
module ShiftRegister8 (input sl, sr, clk, input [7:0] ParIn, input [1:0] m, output reg [7:0] ParOut);
always @(negedge clk) begin
    case (m)
        0: ParOut <= ParOut;
        1: ParOut <= {sl, ParOut[7:1]};
        2: ParOut <= {ParOut[6:0], sr};
        3: ParOut <= ParIn;
        default: ParOut <= 8'bX;
    endcase
end
endmodule
### Checker Code:
`timescale 1ns/100ps
module Tb_ShiftRegister8;
    reg sl, sr, clk;
    reg [1:0] m;
    reg [7:0] ParIn;
    wire [7:0] ParOut;
    ShiftRegister8 u0 (.sl(sl),.sr(sr),.clk(clk),.ParIn(ParIn),.m(m),.ParOut(ParOut));
    always begin
        #5 clk = ~clk;
    end
    initial begin
        clk = 0;
        sl = 0;
        sr = 0;
        m = 0;
        ParIn = 0;
        #100 $finish;
    end
endmodule
`timescale 1ns/100ps
module Tb_ShiftRegister8;
    reg sl, sr, clk;
    reg [1:0] m;
    reg [7:0] ParIn;
    wire [7:0] ParOut;
    ShiftRegister8 u0 (.sl(sl),.sr(sr),.clk(clk),.ParIn(ParIn),.m(m),.ParOut(ParOut));
    always begin
        #5 clk = ~clk;
    end
    initial begin
        clk = 0;
        sl = 0;
        sr = 0;
        m = 0;
        ParIn = 0;
        #100 $finish;
    end
endmodule