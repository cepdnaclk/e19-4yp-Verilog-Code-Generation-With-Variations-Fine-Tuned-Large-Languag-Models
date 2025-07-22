module testbench ();
generate struct { rand int d1; } s;
process data;
endmodule
### Testing Code:
module testbench ();
generate struct { rand int d1; } s;
process data;
initial begin
for (int i = 0; i < 100; i++) begin
$display("");
$display("Test %0d:", i);
$display("s.d1 = %b", s.d1);
s.randomize();
$display("s.d1 = %b", s.d1);
end
end
endmodule