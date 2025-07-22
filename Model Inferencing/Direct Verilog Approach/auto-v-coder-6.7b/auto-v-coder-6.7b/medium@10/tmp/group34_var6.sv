```verilog
module gates4_top (
input wire [3:0] sw,
output wire [2:0] ld,
output wire [3:0] priority_index
);

wire [3:0] and4_output;
wire [3:0] or4_output;
wire [3:0] xor4_output;

gates4 U1
(
.x(sw),
.and4_(and4_output),
.or4_(or4_output),
.xor4_(xor4_output)
);

always @(*) begin
    case ({and4_output, or4_output, xor4_output})
        3'b000: begin
            priority_index = 4'b0001; 
            ld[0] = sw[0];
            ld[1] = sw[1];
            ld[2] = sw[2];
        end
        3'b001: begin
            priority_index = 4'b0010;
            ld[0] = sw[2];
            ld[1] = sw[0];
            ld[2] = sw[1];
        end
        3'b010: begin
            priority_index = 4'b0100;
            ld[0] = sw[1];
            ld[1] = sw[2];
            ld[2] = sw[0];
        end
        3'b011: begin
            priority_index = 4'b0101;
            ld[0] = sw[0];
            ld[1] = sw[1];
            ld[2] = sw[2];
        end
        3'b100: begin
            priority_index = 4'b1000;
            ld[0] = sw[0];
            ld[1] = sw[1];
            ld[2] = sw[2];
        end
        // Add other cases if needed
    endcase
end
endmodule
```
This new code module performs a priority logic based on the inputs from the