```
module dffen(q,d,c);
parameter N=3;
input [N-1:0] d;
input c;
output reg [3:0] q;//output reg and [3:0]
reg [3:0] s_cnt;//s_cnt inside a constant array and wrap combinational block in escaped generate block
generate
if (N<=4) begin:d1
	generate
		genvar i;
		for(i=0;i<4;i=i+1)begin:x1
			always @(*)
			begin
				s_cnt[i]=d[i];
			end
		end
	endgenerate
	always @(*)
	begin
		if (c) q<=s_cnt;
		else q<=q;
	end
end
endgenerate
endmodule
```
### References:
https://www.edaplayground.com/x/Z42
https://www.edaplayground.com/x/Z43