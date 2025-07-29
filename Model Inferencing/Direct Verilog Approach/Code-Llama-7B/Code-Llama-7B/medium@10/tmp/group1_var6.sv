`timescale 1ns/100ps
module ShiftRegister8 (input sl, sr, clk, input [7:0] ParIn, input [1:0] m, output reg [7:0] ParOut);
always @(negedge clk) begin
    case ({m, [2:0] ParIn[7:5]})
        3'b000: ParOut <= ParOut;
        3'b001: ParOut <= {sl, ParOut[7:1]};
        3'b010: ParOut <= {ParOut[6:0], sr};
        3'b011: ParOut <= ParIn;
        3'b100: ParOut <= {1'b0, ParOut[7:1]};
        3'b101: ParOut <= {1'b0, ParOut[6:0], sr};
        3'b110: ParOut <= {1'b0, ParOut[5:0], ParIn[7], sl};
        3'b111: ParOut <= {1'b0, ParOut[4:0], ParIn[6:0], sr};
        default: ParOut <= 8'bX;
    endcase
end
endmodule
### Modified Code Test Bench
```
`timescale 1ns/100ps
module ShiftReg8tb();
reg clk;
reg ParIn [7:0];
reg sl, sr;
reg [1:0] m;
wire [7:0] ParOut;
reg [2:0] m_list = 3'b000,3'b001,3'b010,3'b011,3'b100,3'b101,3'b110,3'b111;
ShiftRegister8 ShReg(ParIn, clk, ParOut, sl, sr, m);

initial begin
    clk = 0;
    #50;
    $display("%d", ParOut);
    ParIn <= 8'hA1;
    clk <= ~clk;
    #50;
    $display("%d", ParOut);
    sl <= 1;
    sr <= 1;
    ParIn <= 8'hB2;
    cl