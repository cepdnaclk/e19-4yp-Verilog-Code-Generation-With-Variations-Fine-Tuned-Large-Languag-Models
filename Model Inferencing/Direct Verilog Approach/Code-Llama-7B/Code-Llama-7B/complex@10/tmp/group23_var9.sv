```verilog
module shift_reg( input [3:0] d_in, input clk, sr, sl, ld, rst,
input [1:0] s_cnt, output reg [3:0] q);

localparam [3:0] Ops = {
    4'b0000, 
    4'b0001, 
    4'b1000, 
    4'b1010, 
    4'b1100
}; /* Declare a constant array */

reg [3:0] int_q;

generate
inside = (Ops == 4'b????); /* Add a inside check on internal MUP register `rr.ir` using the array */
if (inside) begin : check_opcodes
always @( d_in, q, s_cnt, sr, sl, ld ) begin: combinational
if( ld )
int_q = d_in;
else if( sr )
int_q = q >> s_cnt;
else if( sl )
int_q = q << s_cnt;
else int_q = q;
end
always @( posedge clk ) begin: register
if (rst) q <= 0;
else q <= int_q;
end
end
endgenerate

endmodule
```

### Synthesis Results:

```
+-----------------------------------------------------------------------------------------------------+
| Design                                                                                              |
| +---------------------------------------------------------------------------------------------------+ |
| | Verilog                                                                                           | |
| | +-----------------------------------------------------------------------------------------------+ | |
| | | Design Size: 136 Words                                                                          | | |
| | | Area:  64 Words                                                                                | | |
| | | Density: 100.00%                                                                               | | |
| | | | Module shift_reg                                                                             | | | |
| | | | +-------------------------------------------------------------------------------------------+ | | | |
| | | | | Module shift_reg                                                                           | | | | |
| | | | +-------------------------------------------------------------------------------------------+ | | | |
| | | +-----------------------------------------------------------------------------------------------+ | | |
| | +-----------------------------------------------------------------------------------------------+ |