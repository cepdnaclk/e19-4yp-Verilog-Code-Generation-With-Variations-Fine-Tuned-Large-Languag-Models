```timescale 1ns/100ps
module ShiftRegister8 (input sl, sr, clk, input [7:0] ParIn, input [1:0] m, output reg [7:0] ParOut);
always @(negedge clk) begin
    case (m)
        0: ParOut <= ParOut;
        1: ParOut <= {sl, ParOut[7:1]};
        2: ParOut <= {ParOut[6:0], sr};
        3: ParOut <= ParIn;
        default: ParOut <= 8'bX;
        4: ParOut <= {ParOut[6:1], ParOut[0], sr, sl};
    endcase
end
endmodule
```
### Sensitivity List:
```
always @(negedge clk)
```
### Unpacked Arrays:
```