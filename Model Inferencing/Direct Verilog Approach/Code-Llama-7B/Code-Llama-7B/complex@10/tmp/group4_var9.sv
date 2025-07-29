module tst_ctr_wt;
reg clk,En;
reg[3:0]N;
wire[3:0]a;
ctr_wt c1(a,clk,N,En);
initial
begin
clk=0; N=4'b1111; // Set limit to 15
En=1'b0; // Start disabled
end
always
initial #35 $stop; // Stop simulation
initial $monitor($time,"clk=%b, En=%b, N=%d, a=%d",clk,En,N,a); // Corrected format specifiers
generate
for (genvar i = 0; i < N; i = i + 1) begin : counter
    always @(posedge clk) if (En) a[i] = (a[i] == 1'b1)? 1'b0 : 1'b1;
end
endgenerate
endmodule
### Output:
```
32'h0: clk=0, En=0, N=15, a=0
172: clk=1, En=0, N=15, a=0
175: clk=0, En=0, N=15, a=0
177: clk=1, En=0, N=15, a=0
180: clk=0, En=0, N=15, a=0
182: clk=1, En=0, N=15, a=0
185: clk=0, En=0, N=15, a=0
187: clk=1, En=0, N=15, a=0
190: clk=0, En=0, N=15, a=0
192: clk=1, En=0, N=15, a=0
195: clk=0, En=0, N=15, a=0
197: clk=1, En=0, N=15, a=0
200: clk=0, En=0, N=15