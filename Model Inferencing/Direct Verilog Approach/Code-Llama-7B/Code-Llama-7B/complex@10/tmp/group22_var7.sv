module dffen(out,in,en);
reg [7:0] s_cnt = {8{1'b1}};
parameter N=7;

input en,in;
output out;

wire [N:0] tmp;

generate if (s_cnt[N] === 1'b0) begin : gen_esc
reg  [N:0] tmp;
reg [N:0] s_cnt = {8{1'b1}};

//Combinational block
always @* begin
    if (s_cnt[N] === 1'b1) begin
        tmp = {1'b0,tmp[N:1]};
    end else begin
        tmp = in;
    end
end

//Sequential block
always @(posedge clk) begin
    out = tmp[0];
    s_cnt = {1'b0,s_cnt[N:1]};
end

end : gen_esc
endgenerate

endmodule