```verilog
module mealy(Clock, Resetn, w, z);
parameter A = 0, B = 1;
input Clock, Resetn, w;
output z;
enum bit [1:0] {A,B} y,Y;
reg z;
always @(w or y)
case (y)
	A: if (w)
	begin
		z = 0;
		Y = B;
	end
	else
	begin
		z = 0;
		Y = A;
	end
endcase
always @(negedge Resetn or posedge Clock)
if (Resetn == 0) y <= A;
else y <= Y;
endmodule
```