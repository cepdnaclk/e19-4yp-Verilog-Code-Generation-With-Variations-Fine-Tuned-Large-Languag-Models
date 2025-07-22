`timescale 1ns/100ps
module ShiftRegister8 (input sl, sr, clk, input [7:0] ParIn, input [1:0] m, output reg [7:0] ParOut);
always @(negedge clk) begin
    case (m) inside
        [0:0]: ParOut <= ParOut;
        [1:1]: ParOut <= {sl, ParOut[7:1]};
        [2:2]: ParOut <= {ParOut[6:0], sr};
        [3:3]: ParOut <= ParIn;
        default: ParOut <= ParOut;
    endcase
end
endmodule
### Testbench:
`timescale 1ns/100ps
module TestShiftRegister8;
reg sl, sr, clk;
reg [7:0] ParIn;
reg [1:0] m;
wire [7:0] ParOut;
parameter clk_period = 10;
ShiftRegister8 UUT(.*);
initial begin
    clk <= 0;
    forever begin
        #(clk_period/2);
        clk <= ~clk;
    end
end
initial begin
    m <= 0;
    ParIn <= 0;
    sl <= 0;
    sr <= 0;
    #60;
    for (integer i=0; i<4; i=i+1) begin
        #(clk_period*2);
        m <= m + 1;
        if (i < 2) begin
            sl <= (i == 0);
            sr <= (i == 1);
        end
    end
    #(clk_period*2);
    m <= 3;
    ParIn <= 8'hAA;
    #(clk_period*2)
    m <= 0;
    #(clk_period*2)
    $finish;
end
endmodule