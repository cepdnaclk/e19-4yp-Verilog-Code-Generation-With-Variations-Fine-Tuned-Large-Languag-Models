module shift_reg( input [3:0] d_in, input clk, sr, sl, ld, rst,
input [1:0] s_cnt, output reg [3:0] q);

reg [3:0] int_q;
genvar i;
generate 
    for (i=0; i<4; i=i+1) begin 
        always @( d_in, q, s_cnt, sr, sl, ld ) begin: combinational
            if( ld )
                int_q = d_in;
            else if( sr )
                int_q = q >> s_cnt;
            else if( sl )
                int_q = q << s_cnt;
            else int_q = q;
        end: combinational
    end 
endgenerate

always @( posedge clk ) begin: register
    if (rst) q <= 0;
    else q <= int_q;
end: register
endmodule
### Variation Instruction