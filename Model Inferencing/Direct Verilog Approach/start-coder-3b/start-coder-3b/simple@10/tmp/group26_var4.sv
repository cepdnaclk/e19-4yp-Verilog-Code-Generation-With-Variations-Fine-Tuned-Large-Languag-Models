parameter D=7;

module gade(a,a1,b,c,b1,c1);
input b,c,b1,c1;
output a,a1;

wire [D-1:0] a_unpacked;
wire [D-1:0] a1_unpacked;
wire [D-1:0] b_unpacked;
wire [D-1:0] c_unpacked;
wire [D-1:0] b1_unpacked;
wire [D-1:0] c1_unpacked;
wire [D-1:0] d_unpacked;

and #(2,1) gg2(a_unpacked,c_unpacked,b_unpacked);
and #(2,1) gg3(a1_unpacked,c1_unpacked,b1_unpacked);
or  #3 gg1(a1_unpacked,c1_unpacked,b1_unpacked);

assign a1=a_unpacked[D-1], a=a_unpacked[D-2];
assign b1=b_unpacked[D-1], b=b_unpacked[D-2];
assign c1=c_unpacked[D-1], c=c_unpacked[D-2];

endmodule
### Synthesis Log:
#### With the default options

Warning: $PATH_TO_XST/Xst/lib/util/Vivado_DSE/src/top_dse.v:270:9: (Warning) Unconnected Output pin $PATH_TO_XST/Xst/lib/util/Vivado