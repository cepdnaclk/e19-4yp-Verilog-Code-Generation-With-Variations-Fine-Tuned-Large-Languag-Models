module comparator #(parameter BITSIZE = 4)
                 (clk, rst, A, B, A_GT_B, A_EQ_B, A_LT_B);
input clk, rst, A_GT_B, A_EQ_B, A_LT_B;
input [BITSIZE-1:0] A, B;
output [BITSIZE-1:0] HiCount;

localparam [BITSIZE-1:0] LOWEST = 0;
localparam [BITSIZE-1:0] HIGHEST = 3;
reg [BITSIZE-1:0] Adjr;
genvar i;
generate
  for (i=0; i<BITSIZE; i=i+1) begin : GENERATE_LOOP
    assign HiCount[i] = ((A[i]!= B[i])? A[i] : HiCount[i-1]) & A_LT_B;
  end
endgenerate
initial begin
  HiCount = LOWEST;
end
assign Adjr[0] = A[0];
always @(posedge clk) begin
  if (rst) begin
    HiCount <= LOWEST;
  end else begin
    if (A_GT_B)
      HiCount <= A;
    else begin
      if (A_EQ_B)
        HiCount <= LOWEST;
      else
        HiCount <= HiCount + Adjr;
    end
  end
end
endmodule

module t_comparator();
reg clk, rst, A_GT_B, A_EQ_B, A_LT_B;
reg [3:0] A, B;
wire [3:0] HiCount;
comparator #(.BITSIZE(4)) M0(clk, rst, A, B, A_GT_B, A_EQ_B, A_LT_B);
initial
$monitor($time,,"A = %b, B = %b, A_GT_B = %b, A_EQ_B = %b, A_LT_B = %b, HiCount = %b", A, B, A_GT_B