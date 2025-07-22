module dec2_4beh(o,i);
output [3:0] o;
input [1:0]i;
reg[3:0]o;
always@(i)
begin
if(i==2'b00)
o[0]=1'b1;
else if(i==2'b01)
o[1]=1'b1;
else if(i==2'b10)
o[2]=1'b1;
else if(i==2'b11)
o[3]=1'b1;
else
o = 4'b0;
end
endmodule
### Output:
### Verilog Code:

module dec2_4beh( o, i );
output [3:0] o ;
input [1:0] i ;
reg [3:0] o ;
always @(i)
begin
case(i)
2'b00 : o = 4'b0001 ;
2'b01 : o = 4'b0010 ;
2'b10 : o = 4'b0100 ;
2'b11 : o = 4'b1000 ;
default : o = 4'b0000 ;
endcase
end
endmodule
### Output: