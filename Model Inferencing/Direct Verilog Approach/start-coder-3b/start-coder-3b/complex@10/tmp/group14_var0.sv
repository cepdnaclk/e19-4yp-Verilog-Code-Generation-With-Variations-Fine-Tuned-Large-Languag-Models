module sat_cnt (
input wire clk,
input wire reset,
output reg [1:0] cntr
);
assign cntr = reset? 0 : (clk & ~reset)? cntr + 1 : cntr;
endmodule

### 7.2.9. Example 8: Saturating Counter