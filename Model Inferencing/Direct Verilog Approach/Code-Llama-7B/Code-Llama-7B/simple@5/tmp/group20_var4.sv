module latch (input d, c, packed_union 7:0  q, output reg [7:0] q_b );
always begin
wait ( c );
end
endmodule
### Testbench:
module testbench();
latch dut(d, c, q, q_b);
reg d, c;
initial begin
c = 1'b1;
always @(d, c) begin
@(posedge c);
d <= 1'b0;
end
end
endmodule
### Result:
> Error (Suppressible):