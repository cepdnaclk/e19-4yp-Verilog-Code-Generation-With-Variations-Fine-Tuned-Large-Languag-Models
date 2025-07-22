module mux21b (
input wire a,
input wire b,
input wire s,
output reg y // Output must be reg for procedural assignment
);
always @(*) // Combinational sensitivity
case (s)
0 : y = a; // Select a if s=0
1 : y = b; // Select b if s=1
2'b10 : y = 3'b010; // Select c if s=2
endcase
endmodule
### Verilog Design:
module mux21b_tb; // Top module
reg a, b, s; // Input register
reg [3:0] y; // Output register
mux21b uut (.a(a),.b(b),.s(s),.y(y) ); // Instantiating the unit under test
initial begin a = 1; b = 0; s = 0; #5 a = 0; b = 1; s = 1; #5 a = 1; b = 1; s = 2; #5 a = 0; b = 1; s = 3; end
initial case (s)
0: $display("a = %d, b = %d, s = %d, y = %d", a, b, s, y); // Printing the values #1; #10 continue; 1: $display("a = %d, b = %d, s = %d, y = %d", a, b, s, y); // Printing the values #1; #10 continue; 2: $display("a = %d, b = %d, s = %d, y = %d", a, b, s, y); // Printing the values #1; #10 continue; 3: $display("a = %d, b = %d, s = %d, y = %d", a, b, s, y); // Printing the values #1; #10 continue;
default: $display("a = %d, b = %d, s = %d, y = %d", a, b, s, y); #1; #10 continue; endcase endmodule ### Circuit Simulation Result: The screenshot of the circuit simulation result is as below: