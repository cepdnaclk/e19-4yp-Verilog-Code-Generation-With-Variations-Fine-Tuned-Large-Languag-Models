module mux221b (
input wire a,
input wire b,
input wire s,
output reg y // Output must be reg for procedural assignment
);
always @(*)
case(s)
1'b0 : y = a; // Select a if s=0
1'b1 : y = b; // Select b if s=1
2'b00 : y = a; // Select a if s=2
2'b01 : y = a; // Select a if s=2
2'b10 : y = b; // Select b if s=3
2'b11 : y = b; // Select b if s=3
endcase
endalways
endmodule

#### Combinational Module Example:

module modulename (
input wire a,
input wire b,
output reg y // Output must be reg for procedural assignment
);
assign y = a + b;
endmodule

• The above code will make the value of y the sum of the value of a and the value of b i.e. the value of y = a + b
• The code will run everytime one of the inputs changes.
• The above code will make the value of y the sum of the value of a and the value of b i.e. the value of y = a + b
• The code will run everytime one of the inputs changes.
##### Verilog Code with Comment:
module mux221b (
input wire a,
input wire b,
input wire s,
output reg y // Output must be reg for procedural assignment
);
assign y = a + b;
endmodule

## 2. The Mux222b Module

### Module 1:

module mux12 (
input wire a,
input wire b,
input wire s,
output reg y
);

always @ (posedge s)
if (s)
y = a;
else
y = b;

endmodule

### Base Verilog Code:

module mux222b (
input wire a,
input wire b,
input wire s,
output reg y // Output must be reg for procedural assignment
);
always @(*)
case(s)
1'b0 : y = a;
1'b1 : y = b;
2'b00 : y = a;
2'b01 : y = b;
2'b10 : y = a;
2'b11 : y = b;
endcase
endalways
endmodule

• s is an input to the module and it has three options

• If it is 0 then the value of y will be the value of a.
• If it is 1 then the value of y will be the value of b.
• If it is 2 then the value of y will be the value of a.

#### Combinational Module Example:

module modulename (
input wire a,
input wire b,
output reg y // Output must be reg for procedural assignment
);
assign y = a + b;
endmodule

• The above code will make the value of y the sum of the value of a and the value of b i.e. the value of y = a + b
• The code will run everytime one of the inputs changes.
• The above code will make the value of y