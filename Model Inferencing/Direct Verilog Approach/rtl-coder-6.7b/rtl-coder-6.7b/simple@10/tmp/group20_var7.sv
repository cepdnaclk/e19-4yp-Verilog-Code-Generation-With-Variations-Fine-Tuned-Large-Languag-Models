module latch (input d, c, output reg [7:0] q);
reg [7:0] q_sig;
always begin
  q_sig = d;
  wait ( c );
end
endmodule