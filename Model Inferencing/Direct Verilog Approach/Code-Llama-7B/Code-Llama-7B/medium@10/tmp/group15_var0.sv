```verilog
timescale 1ns/100ps
module ALU8 (input [7:0] left, right, input [1:0] mode, output reg [7:0] ALUout);
always_comb begin
    ALUout = left;
    case (mode)
        0: ALUout[7:0] = left[7:0] + right[7:0];
        1: ALUout[7:0] = left[7:0] - right[7:0];
        2: ALUout[7:0] = left[7:0] & right[7:0];
        3: ALUout[7:0] = left[7:0] | right[7:0];
        default: ALUout[7:0] = 8'bX;
    endcase
end
endmodule
```
### Modify Verilog Code:
Add a new signal which holds the part select of `ALUout` for the case of `mode == 2` to avoid repetitive part selects in `ALUout[7:0]`.
```verilog
timescale 1ns/100ps
module ALU8 (input [7:0] left, right, input [1:0] mode, output reg [7:0] ALUout);
// Add signal for holding part select of ALUout only once in case of mode == 2
wire [7:0] ALUout_part_select;
always_comb begin
    ALUout = left;
    case (mode)
        0: ALUout[7:0] = left[7:0] + right[7:0];
        1: ALUout[7:0] = left[7:0] - right[7:0];
        2: ALUout_part_select[7:0] = left[7:0] & right[7:0];
        3: ALUout[7:0] = left[7:0] | right[7:0];
        default: ALUout[7:0] = 8'bX;
    endcase
end
// Add assignment of ALUout_part_select to ALUout[7:0] only when mode == 2
assign ALUout[7:0] = (mode == 2)? ALUout_part_select[7:0] : ALUout[7:0];
endmodule
```
### Modify Verilog Code:
Fix the bug in the modified code, where `ALUout_part_select` was not assigned to `ALUout[7:0]` on mode == 3.
```verilog
timescale 1ns/100ps
module ALU8 (input [7:0] left, right, input [1:0] mode, output reg [7:0] ALUout);
// Add signal for holding part select of ALUout only once in case of mode == 2
wire [7:0] ALUout_part_select;
always_comb begin
    ALUout = left;
    case (mode)
        0: ALUout[7:0] = left[7:0] + right[7:0];
        1: ALUout[7:0] = left[7:0] - right[7:0];
        2: ALUout_part_select[7:0] = left[7:0] & right[7:0];
        3: ALUout_part_select[7:0] = left[7:0] | right[7:0];
        default: ALUout[7:0] = 8'bX;
    endcase
end
// Add assignment of ALUout_part_select to ALUout[7:0] only when mode == 2 or 3
assign ALUout[7:0] = (mode == 2)? ALUout_part_select[7:0] : (mode == 3)? ALUout_part_select[7:0] : ALUout[7:0];
endmodule
```
### Modify Verilog Code:
If you look in the [Mux16-16](https://github.com/efabless/open_lanai/blob/main/verilog/designs/Mux16-16/Mux16-16.v) design we find that there is an