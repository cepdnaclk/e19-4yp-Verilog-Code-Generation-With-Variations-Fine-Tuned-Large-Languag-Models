```verilog
timescale 1ns/100ps
module ShiftRegister8 (input sl, sr, clk, input [7:0] ParIn, input [1:0] m, output reg [7:0] ParOut);
always @(negedge clk) begin
    case (m)
        0: ParOut <= ParOut;
        1: ParOut <= {sl, ParOut[7:1]};
        2: ParOut <= {ParOut[6:0], sr};
        3: ParOut <= {ParIn[5:2], ParIn[1:0], ParOut[7:6]};
        default: ParOut <= 8'bX;
    endcase
end
endmodule
```
### Simulation:
![Simulation](https://github.com/Elsfa7-110/Verilog-Tutorial/blob/master/11%20-%20Vector%