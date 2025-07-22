module dffen (d,q,en);
localparam max = 8;
input bit di, en;
output wire d;
reg [max:0] s_cnt;
assign s_cnt = (en)? s_cnt+1 : 0;
always @(posedge en) begin
d <= di;
end
endmodule