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
### Verification Code:
`timescal 1ns/100ps
module TestBench ();
reg clk, sl, sr;
reg [1:0] m;
reg [7:0] ParIn;
wire [7:0] ParOut;
integer i;
ShiftRegister8 DUT (.sl(sl),.sr(sr),.clk(clk),.ParIn(ParIn),.m(m),.ParOut(ParOut));
initial begin
    clk = 0;
    forever #20 clk = ~clk;
end
initial begin
    sl = 1;
    sr = 0;
    m = 0;
    ParIn = 8'h00;
    #1000
        m = 1;
        ParIn = 8'h01;
    #1000
        m = 2;
        ParIn = 8'h10;
    #1000
        m = 3;
        ParIn = 8'h55;
    #1000
        $finish;
end
endmodule
### Verification Script:
`svlog SV_ShiftRegister8.sv
`svlog TestBench.sv
`svsim +access +all tb