module latch
#( parameter bit data_width = 8 )
( input d, c, output reg [data_width-1:0] q, q_b );
always begin
wait ( c );
end
endmodule