module mux21b_variant (
input wire a,
input wire b,
input wire s,
output reg y // Output must be reg for procedural assignment
);
always @(*) // Combinational sensitivity
if(s == 0)
y = a; // Select a if s=0
else 
case (s)
	1: y = b;
	2: y = a;
	3: y = b;
	4: y = a;
	default: y = a;
endcase
endmodule
### Results:
Simulation result:
<div style="max-width: 90%; margin: auto; position: relative;">
	<iframe src="https://www.tutorialspoint.com/compile_verilog_online.php" height="400" width="100%" style="border: 1px solid #999;"></iframe>
</div><br>

Synthesized result:
<div style="max-width: 90%; margin: auto; position: relative;">
	<iframe src="https://www.edaplayground.com/x/Xf6W" height="400" width="100%" style