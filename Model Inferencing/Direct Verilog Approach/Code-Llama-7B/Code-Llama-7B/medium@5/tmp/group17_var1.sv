module mux41b (
input wire [3:0] c,
input wire [1:0] s,
output wire z
);
assign z =
case({s[1],s[0]})
1 : c[3]
2 : c[2]
3 : c[1]
default : c[0]
endcase;
endmodule

### Test Bench:

module mux41b_test;
reg [3:0] c;
wire z;
reg [1:0] s;
reg [1:0] r;
wire [1:0] u;
reg n;

always@(s,c)
begin
r=s;
u=c;
end

initial
begin
c[0]=1'b1;
c[1]=1'b1;
c[2]=1'b1;
c[3]=1'b0;
for (n=1;n<=10;n=n+1)
begin
s=r;
#10
c=u;
#10
end
end

mux