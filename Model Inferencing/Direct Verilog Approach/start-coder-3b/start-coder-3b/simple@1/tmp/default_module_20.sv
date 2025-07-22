module counter (d, c, output q, q_b );
wire [7:0] s;

always @ ( posedge c )
begin
s <= d + s;
end

assign q = s[3:0];
assign q_b = s[4:0];

endmodule