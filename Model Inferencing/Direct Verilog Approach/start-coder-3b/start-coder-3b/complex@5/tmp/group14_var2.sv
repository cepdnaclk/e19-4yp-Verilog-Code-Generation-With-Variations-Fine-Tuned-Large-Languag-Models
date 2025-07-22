module hex7seg_le (
input wire [3:0] x,
output wire [6:0] a_to_g // Outputs for segments a,b,c,d,e,f,g
);
// Logic equations for each segment (active high assumed)

generate
for(i=6;i>0;i=i-1)
begin:
assign a_to_g[i] = x[3] & x[2] & x[1] & x[0]
&!a_to_g[i];
end
endgenerate

assign a_to_g[0] = ~x[3] & ~x[2] & ~x[1] & ~x[0] // g (segment index 0)
| x[3] & x[2] & ~x[1] & ~x[0]
| ~x[3] & x[2] & x[1] & x[0];
endmodule
`

#### 

• 
• 
• 
• 
• 
• 
•