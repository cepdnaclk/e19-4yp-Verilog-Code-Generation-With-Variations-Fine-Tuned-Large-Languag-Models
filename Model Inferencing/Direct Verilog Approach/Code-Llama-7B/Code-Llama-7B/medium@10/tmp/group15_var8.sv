```verilog
timescale 1ns/100ps
module ALU8 (input [7:0] left, right, input [3:0] mode, output reg [7:0] ALUout);
always @* begin
    case (mode[1:0])
        0: ALUout = (mode[3:2] == 2'b00)? 
                    left[3:0] + right[3:0] : 
                    left[7:4] + right[7:4];
        1: ALUout = (mode[3:2] == 2'b00)? 
                    left[7:4] - right[7:4] : 
                    left[3:0] - right[3:0];
        2: ALUout = (mode[3:2] == 2'b00)? 
                    left[3:0] & right[3:0] : 
                    left[7:4] & right[7:4];
        3: ALUout = (mode[3:2] == 2'b00)? 
                    left[3:0] | right[3:0] : 
                    left[7:4] | right[7:4];
        default: ALUout = 8'bX;
    endcase
end
endmodule
```

### Reference:
https://www.xilinx