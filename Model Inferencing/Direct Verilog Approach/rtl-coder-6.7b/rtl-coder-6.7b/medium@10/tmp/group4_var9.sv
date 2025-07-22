module nor3NMOS(in1,in2,in3,b); // 3-input NMOS NOR
  output b;
  input in1,in2,in3;
  supply0 a; // Ground
  wire b; // Output wire
  // Parallel NMOS transistors connect output to ground
  nmos (b, a, in1);
  nmos (b, a, in2);
  nmos (b, a, in3);
  pullup (b); // Pullup device on the output
  // Case statement to determine the index
  always @(index) begin
    case (index)
      1'b0: b = ~in1;
      1'b1: b = ~in2;
      inside {{1'b0,1'bx},{1'bx,1'b1}}: b = ~in3;
      default: b = in3;
    endcase
  end
endmodule