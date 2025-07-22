module comparator (A, B, HiCount);
input signed [31:0] A, B;
output reg [31:0] HiCount;
always @(negedge clk) begin
if (A[31] > B[31]) begin
HiCount[31] = 1;
end
else if (A[31] < B[31]) begin
HiCount[31] = 0;
end
else begin
HiCount[31] = Adjr[31];
end
end
endmodule