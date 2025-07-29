```verilog
module ShiftRegister #(parameter N = 8) (input sl, sr, clk, input [N-1:0] ParIn, input [1:0] m, output reg [N-1:0] ParOut);
    always @(negedge clk) begin
        case (m)
            0: ParOut <= ParOut;
            1: ParOut <= {sl, ParOut[N-1:1]};
            2: ParOut <= {ParOut[N-1:2], sr};
            3: ParOut <= ParIn;
            default: case (N)
                    0: ParOut <= {N{1'bX}};
                    1: ParOut <= {1'bX};
                    2: ParOut <= {ParOut[1:0]};
                    3: ParOut <= {ParOut[2:1]};
                    4: ParOut <= {ParOut[3:1]};
                    5: ParOut <= {ParOut[4:1]};
                    6: ParOut <= {ParOut[5:1]};
                    7: ParOut <= {ParOut[6:1]};
                    8: ParOut <= {ParOut[7:1]};
                    default: ParOut <= {N{1'bX}};
                endcase
        endcase
    end
endmodule
```
### Simulation:
![simulation](./waveform2.jpg)


### Task 3

The new module is an array of parameterized modules.
### Base Verilog Code:
```verilog
module ShiftRegister #(parameter N = 8) (input sl, sr, clk, input [N-1:0] ParIn, input [1:0] m, output reg [N-1:0] ParOut);
    always @(negedge clk) begin
        case (m)
            0: ParOut <= ParOut;
            1: ParOut <= {sl, ParOut[N-1:1]};
            2: ParOut <= {ParOut[N-1:2], sr};
            3: ParOut <= ParIn;
            default: case (N)
                    0: ParOut <= {N{1'bX}};
                    1: ParOut <= {1'bX};
                    2: ParOut <= {ParOut[1:0]};
                    3: ParOut <= {ParOut[2:1]};
                    4: ParOut <= {ParOut[3:1]};
                    5: ParOut <= {ParOut[4:1]};
                    6: ParOut <= {