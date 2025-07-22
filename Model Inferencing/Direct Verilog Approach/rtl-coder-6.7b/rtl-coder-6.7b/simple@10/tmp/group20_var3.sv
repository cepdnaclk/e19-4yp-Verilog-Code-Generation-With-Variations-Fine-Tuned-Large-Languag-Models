module latch (input [7:0] d, c, output reg [7:0] q, q_b );
always begin
wait ( c );
end
endmodule