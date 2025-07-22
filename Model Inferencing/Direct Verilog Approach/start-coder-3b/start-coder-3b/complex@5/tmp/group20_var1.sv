module MIPS_Register_File_Top;
reg [40:0] r_a, r_b, r_dest, r_data;
integer read_data_sel;
integer write_data_sel;
integer d_control;
wire [31:0] read_data;
wire [31:0] write_data;
wire [31:0] mux_sel;
assign mux_sel = d_control? r_data : r_a;
assign write_data = r_data;
assign read_data = mux_sel;
assign r_dest = r_a + r_b;
initial
begin
d_control = 1'b0;
end
assign write_data_sel = d_control + 2'b0;
assign read_data_sel = d_control + 2'b1;
package muxArray;
integer [31:0] dControlArray;
dControlArray[15:0] = {1, 0};
dControlArray[31:16] = {0, 1};
endpackage
endmodule

### Diff comparison:
```
--- before/MIPS_Register_File_Top.v	2019-11-15 19:53:04.746439451 -0800
+++ after/MIPS_Register_File_Top.v