module mux21b (
input wire a,
input wire b,
input wire s,
output reg y // Output must be reg for procedural assignment
);
always @(*) // Combinational sensitivity
if(s == 0)
y = a; // Select a if s=0
else
y = b; // Select b if s=1
endmodule

module mux21b (
input wire a,
input wire b,
input wire s,
output reg y // Output must be reg for procedural assignment
);
always @(*) // Combinational sensitivity
   if(s == 0)
       y = a; // Select a if s=0
   else
       y = b; // Select b if s=1
endmodule

module mux21b (
input wire a,
input wire b,
input wire s,
output reg y // Output must be reg for procedural assignment
);
always @(*) // Combinational sensitivity
   case(s)
   1'b0 : y = a; // Select a if s=0
   1'b1 : y = b; // Select b if s=1
   endcase
endmodule

module mux21b (
input wire a,
input wire b,
input wire s,
output reg y // Output must be reg for procedural assignment
);
always @(*) // Combinational sensitivity
   case(s)
   1'b0 : y = a; // Select a if s=0
   1'b1 : y = b; // Select b if s=1
   endcase
endmodule

module mux21b (
input wire a,
input wire b,
input wire s,
output reg y // Output must be reg for procedural assignment
);
always @(*) // Combinational sensitivity
   for (int i=0; i<2; i=i+1) // Iterating through the array
   case(i)
   0 : y = a; // Select a if s=0
   1 : y = b; // Select b if s=1
   endcase
endmodule

module mux21b (
input wire a,
input wire b,
input wire s,
output reg y // Output must be reg for procedural assignment
);

always @(*) // Combinational sensitivity
   for (int i=0; i<2; i=i+1) // Iterating through the array
   case(i)
   0 : y = a; // Select a if s=0
   1 : y = b; // Select b if s=1
   endcase

endmodule

module mux21b (
input wire a,
input wire b,
input wire s,
output reg y // Output must be reg for procedural assignment
);

always @(*) // Combinational sensitivity
   for (int i=0; i<2; i=i+1) // Iterating through the array
   case(s)
   2'b00 : y = a; // Select a if s=0
   2'b01 : y = b; // Select b if s=1
   endcase

endmodule

module mux21b (
input wire [1:0] s,
input wire [7:0] a,
input wire [7:0] b,
output reg [7:0] y // Output must be reg for procedural assignment
);

always @(*) // Combinational sensitivity
   for (int i=0; i<2; i=i+1) // Iterating through the array
   case(s)
   2'b00 : y = a; // Select a if s=0
   2'b01 : y = b; // Select b if s=1
   endcase

endmodule

module mux21b (
input wire s,
input wire [7:0] a,
input wire [7:0] b,
output reg [7:0] y // Output must be reg for procedural assignment
);

always @(*) // Combinational sensitivity
   case(s)
   '0 : y = a; // Select a if s=0
   '1 : y = b; // Select b if s=1
   endcase

endmodule

module mux21b (
input wire s,
input wire [7:0] a,
input wire [7:0]