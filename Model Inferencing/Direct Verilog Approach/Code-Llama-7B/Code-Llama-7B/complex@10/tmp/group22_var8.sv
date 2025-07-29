#### With inside Operator:
module dffen_with_inside(d,c,en);
parameter [1:0] DATA_WIDTH = 4;
localparam [DATA_WIDTH-1:0] ZERO = 0, ONE = 1, TWO = 2;
localparam [DATA_WIDTH-1:0] s_cnt [0:3] = {ZERO,ONE,TWO,ZERO};
input [DATA_WIDTH-1:0] c;
output [DATA_WIDTH-1:0] d;
input en;
reg [DATA_WIDTH-1:0]d;
generate
// Generate a D flip-flop for each bit of the register
for(genvar i = 0; i < DATA_WIDTH; i = i + 1) begin : d_flipflops
always @(negedge en)
begin
if(en)d[i] <= c[i];
else d[i] <= s_cnt[i];
end
end
endgenerate
endmodule
#### With Wrapper:
module dffen_with_wrapper(d,c,en);
parameter [1:0] DATA_WIDTH = 4;
localparam [DATA_WIDTH-1:0] ZERO = 0, ONE = 1, TWO = 2;
localparam [DATA_WIDTH-1:0] s_cnt [0:3] = {ZERO,ONE,TWO,ZERO};
input [DATA_WIDTH-1:0] c;
output [DATA_WIDTH-1:0] d;
input en;
reg [DATA_WIDTH-1:0]d;
generate
// Generate a D flip-flop for each bit of the register
for(genvar i = 0; i < DATA_WIDTH; i = i + 1) begin : d_flipflops
always@(negedge en)
begin
if(en)d[i] <= c[i];
else 
begin
#1;
d[i] <= s_cnt[i];
end
end
endgenerate
endmodule