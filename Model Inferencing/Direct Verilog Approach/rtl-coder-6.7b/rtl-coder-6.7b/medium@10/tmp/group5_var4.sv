module jkEdgeFF (output reg q, input clock, j, k, preset, clear);
parameter N = 2;
logic [N-1:0] data;
assign q = data[0];
always_ff @ (posedge clock)
begin
if (clear)
data <= '0;
else if (preset)
data <= '1;
else
data <= (j & ~k)? (data + 1'b1) :
(~j & k)? (data - 1'b1) :
(j & k)? ~data : data;
end
endmodule
### Description:
In this variation, the procedural assignment is inside with a constant index into a 2D logic array.
### Expected Result:
Test MDA passes with the following command:
### Command:
### Flags:
### Misc Options:
## Flag: -enable_mda_dce
## Value: 1
### Variation Name:
2D_Logic_Array_Constant_Index
### Variation Description:
### Variation Command:
### Variation Flags: