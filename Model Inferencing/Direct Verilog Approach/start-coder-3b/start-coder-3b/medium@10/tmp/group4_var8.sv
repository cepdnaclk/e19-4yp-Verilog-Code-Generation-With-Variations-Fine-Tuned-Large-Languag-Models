```verilog
module and_gate (
  input I1,
  input I2,
  output O
);
// Code from previous example goes here

always @ (posedge I1 or posedge I2) begin
  if (I1 && I2) begin
    O <= 1'b1;
  end
  else begin
    O <= 1'b0;
  end
end
endmodule
module nor3NMOS (
  input in1,
  input in2,
  input in3,
  output b
);
// Code from previous example goes here
// Parallel NMOS transistors connect output to ground
wire a;
nmos (b, a, in1);
nmos (b, a, in2);
nmos (b, a, in3);
pullup (b); // Pullup device on the output
endmodule
module jk_flipflop (
  output Q,
  input J,
  input K
);
// Code from previous example goes here
// Write your variation code here
module or_gate (
  input I1,
  input I2,
  output O
);
// Code from previous example goes here

always @ (posedge I1 or posedge I2) begin
  if (I1 && I2) begin
    O <= 1'b1;
  end
  else begin
    O <= 1'b0;
  end
end
endmodule

module nor3NMOS (
  input in1,
  input in2,
  input in3,
  output b
);
// Code from previous example goes here
// Parallel NMOS transistors connect output to ground
wire a;
nmos (b, a, in1);
nmos (b, a, in2);
nmos (b, a, in3);
pullup (b); // Pullup device on the output
endmodule

module not_gate (
  input I,
  output O
);
// Code from previous example goes here

always @ (posedge I) begin
  if (I) begin
    O <= 1'b0;
  end
  else begin
    O <= 1'b1;
  end
end

endmodule

module jk_flipflop (
  output Q,
  input J,
  input K
);
// Code from previous example goes here

module nor3NMOS (
  input in1,
  input in2,
  input in3,
  output b
);
// Code from previous example goes here