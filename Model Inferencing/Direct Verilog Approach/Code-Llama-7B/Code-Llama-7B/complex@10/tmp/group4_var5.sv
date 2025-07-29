module tst_ctr_nested_range;
reg clk;
reg[3:0]N;
wire[3:0]a;
ctr_nested_range c1(a,clk,N);
initial
begin
clk=0; N=15; // Set limit to 15
end
generate
genvar i;
for (i = 0; i < 16; i++) begin
    always @(posedge clk)
        if (a == i)
            $display("OK: a=%d, i=%d",a,i);
end
endgenerate
initial
begin
$monitor($time,"clk=%b, N=%d, a=%d",clk,N,a);
#35 $stop; // Stop simulation
end
endmodule