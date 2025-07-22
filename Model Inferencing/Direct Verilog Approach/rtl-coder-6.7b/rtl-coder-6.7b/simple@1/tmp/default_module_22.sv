module par_tb;
s2 x;
logic parity, all_ones;
initial begin
x = 8'b0000_0000;
$display("x = %b", x);
x = 8'b0000_0101;
$display("x = %b", x);
x = 8'b0110_0000;
$display("x = %b", x);
x = 8'b1111_1111;
$display("x = %b", x);
par par_inst(.in(x),.parity(parity),.all_ones(all_ones));
end
endmodule

### Results:
x = 0000_0000
x = 0000_0101
x = 0110_0000
x = 1111_1111
parity = 1
all_ones = 0