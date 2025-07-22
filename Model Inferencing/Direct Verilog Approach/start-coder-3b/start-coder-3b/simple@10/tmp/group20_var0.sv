module latch (input d, c, input [5:0] clk, output [7:0] q, q_b );

reg [7:0] d_b;
reg [7:0] c_b;

initial
begin
d_b <= d;
c_b <= c;
end

always @(posedge clk)
begin
d_b <= d;
c_b <= c;
end
endmodule

### Observed Behavior:

### Expected Behavior:

### Steps to Reproduce:

### Error Messages: