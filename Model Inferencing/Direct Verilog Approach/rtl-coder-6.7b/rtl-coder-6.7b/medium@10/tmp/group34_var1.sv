module gates4_top (
input wire [3:0] sw,
output wire [2:0] ld
);
wire [3:0] x;
wire and4_, or4_, xor4_;
gates4 U1 // Assuming 'gates4' provides and4_, or4_, xor4_ outputs from input 'x'
(
.x(x),
.and4_(and4_),
.or4_(or4_),
.xor4_(xor4_)
);
genvar i;
generate
for (i=0;i<=4;i++) begin: mda_select
assign x[i] = sw[i];
end
endgenerate

always @ (sw) begin : priority
casex (sw)
4'b??0? : ld <= and4_;
4'b?0?1 : ld <= or4_;
4'b1??? : ld <= xor4_;
default : ld <= 3'b000;
endcase
end
endmodule
### Expected Output:
### sw | ld (expected)
### 0,0,0,0 | 0, 0, 0
### 0,0,0,1 | 0, 0, 1
### 1,0,1,1 | 1, 1, 0
### 0,1,1,1 | 1, 1, 0
### 1,1,1,1 | 1, 1, 1