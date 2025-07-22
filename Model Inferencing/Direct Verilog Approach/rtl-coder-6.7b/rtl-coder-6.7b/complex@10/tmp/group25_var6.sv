```verilog

package my_pkg;
function [3:0] HiCount(logic x);
    begin
        HiCount = '0;
        HiCount = x? 4'd1 : 4'd0;
        HiCount += x? 4'd0 : 4'd1;
        HiCount += x? 4'd0 : 4'd1;
        HiCount += x? 4'd0 : 4'd1;
    end
endfunction
endpackage : my_pkg



module comparator (A, B, A_gt_B, A_lt_B, A_eq_B);
// 16-bit, signed numbers
input [15:0] A;
input [15:0] B;
output A_gt_B;
output A_lt_B;
output A_eq_B;

wire signed [15:0] DIFF;
wire signed [15:0] ZERO;
assign ZERO = 4'd0;
// Difference
assign DIFF = A - B;
assign A_gt_B = DIFF > ZERO;
assign A_lt_B = DIFF < ZERO;
assign A_eq_B = DIFF == ZERO;
wire [15:0] HiCount;

assign HiCount = my_pkg::HiCount(DIFF > ZERO);
generate
    if (HiCount == 4'd0) begin : Adjr_gt_0
        assign DIFF = (DIFF > ZERO)? DIFF + 4'd1 : DIFF;
    end
    else begin : No_Adjr
        assign DIFF = DIFF > ZERO? DIFF : DIFF + 4'd1;
    end
endgenerate
endmodule
```