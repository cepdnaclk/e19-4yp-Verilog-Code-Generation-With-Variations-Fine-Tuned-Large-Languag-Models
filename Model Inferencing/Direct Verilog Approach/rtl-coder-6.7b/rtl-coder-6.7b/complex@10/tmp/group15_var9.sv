`module updcounter(output reg[3:0]a, input clk, input[3:0]N, input u_d); //COUNTER`
`generate`
    `begin`
        localparam DLY=100;
    `end`
`endgenerate`
`localparam RST_X=0;
`generate`
    `begin`
        localparam RST_Z=2**($bits(a)-1);
    `end`
`endgenerate`
`generate`
    `begin`
        //`ifdef RST_X`
        always @ (posedge clk)
            if (u_d == RST_X)
                a  <= RST_Z;
        else
                a  <= a + 1'b1;
        //`else`
            //`if RST_Z`
                //`endif`
    `end`
`endgenerate`
`endmodule`
### Output:
`$ vlog tst_updcounter.v`
`$ vsim -voptargs="+acc" -sv_lib tst_updcounter`

### Original Code:
`module updcounter(output reg[3:0]a, input clk, input[3:0]N, input u_d); //COUNTER`
`generate`
    `begin`
        localparam DLY=100;
    `end`
`endgenerate`
`localparam RST_X=0;
`generate`
    `begin`
        localparam RST_Z=2**($bits(a)-1);
    `end`
`endgenerate`
`generate`
    `begin`
        always @ (posedge clk)
            if (u_d == RST_X)
                a  <= RST_Z;
            else
                a  <= a + 1'b1;
    `end`
`endgenerate`
`endmodule`
### Output:
`$ vlog tst_updcounter.v`
`$ vsim -voptargs="+acc" -sv_lib tst_updcounter`

### Original Output:
![[Pasted image