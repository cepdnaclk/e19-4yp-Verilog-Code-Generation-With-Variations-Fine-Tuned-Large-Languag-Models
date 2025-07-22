module latch (input d, c, output q, q_b );
union {
reg [7:0] out;
struct {
q_b;
q;
} out;
} out;
always begin
wait ( c );
end
endmodule