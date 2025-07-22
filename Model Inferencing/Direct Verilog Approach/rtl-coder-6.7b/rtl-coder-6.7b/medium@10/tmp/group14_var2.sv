module mux21b (
input wire [1:0]a,
input wire [1:0]b,
input [1:0] s,
output reg y // Output must be reg for procedural assignment
);
always @(*) // Combinational sensitivity
case ({s, 2'b0})
2'b00, 2'b10: y = a; // Select {a,b} if s=0 or s=2
2'b01: y = b; // Select b if s=1
default: y = a; // Default to a
endcase
endmodule
### References:
http://www.doulos.com/knowhow/verilog/prog/verilog_priority_case/
### Additional Notes:
- Combinational sensitivity.
- Case statement with packed array.
- Procedural assignment required for reg.
### Additional References:
- http://www.eecg.toronto.edu/~jayaraman/eec3138/lectures/09-mux.pdf
- http://www.doulos.com/knowhow/verilog/verilog_modules/
- https://www.lri.fr/~fabrice/eurosim2015/
- http://www.veriloginfo.org/sizes/index.html
- http://www.doulos.com/knowhow/verilog/verilog_modules/
- https://www.lri.fr/~fabrice/eurosim2015/
- http://www.veriloginfo.org/sizes/index.html